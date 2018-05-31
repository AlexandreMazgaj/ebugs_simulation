#!/usr/bin/env python
# coding=utf-8

import rospy
import math
import random
from ebugs_message.msg import Force
from ebugs_message.msg import Position
from ebugs_message.msg import Command

# values taken from Erwin's report
Ca = 230
Cr = 240
Ct = 240
Cp = 230
la = 200
lr = 75

# values needed to compute the positions of the robots
wheel_radius = (6.67/2.0) # in cm
distance_between_wheel = 7.8 # in cm

def sendingFirstMockGoals():
    command = Command()

    command.target_position.x = random.randint(10, 20)
    command.target_position.y = random.randint(10, 20)

    ebug1 = Position()
    ebug1.x = 1
    ebug1.y = 1
    ebug1.angle = 40

    ebug2 = Position()
    ebug2.x = 10
    ebug2.y = 15
    ebug2.angle = 180


    command.robots_position.append(ebug1)
    command.robots_position.append(ebug2)

    return command



def getDistanceToTarget(rob_pos, target_pos):
    xdiff = rob_pos.x - target_pos.x
    ydiff = rob_pos.y - target_pos.y
    dist = math.sqrt(math.pow(xdiff, 2) + math.pow(ydiff, 2))

    return dist

# we get the target position from the mock_goal node, which helps us to
# decide which robot is the leader (the closer to the target)
# choose leader send the sorted id of the ebugs, from closest to the target, to
# the furthest away
def chooseLeader(command):
    ebugs_pos = command.robots_position
    target_pos = command.target_position

    ebugs_dist_to_target = []

    for e_pos in ebugs_pos:
        dist_of_current_ebug = getDistanceToTarget(e_pos, target_pos)
        # here we get the distance to the target of each ebug and put it in
        # an array to be able to choose the leader from the ebugs
        ebugs_dist_to_target.append(dist_of_current_ebug)


    sorted_ebugs = []
    num_of_ebugs = len(ebugs_dist_to_target)
    # here we sort the ebugs according to their distance to the target
    for i in range(num_of_ebugs):
        # we set the ref to the dist of the first ebug
        min_distance = ebugs_dist_to_target[0]
        closest_ebug = 0
        # we get the minimum distance
        for j in range(len(ebugs_dist_to_target)):
            if (ebugs_dist_to_target[j] < min_distance):
                min_distance = ebugs_dist_to_target[j]
                closest_ebug = j

        # we add to the sorted list of ebug the ebug closest to the target
        sorted_ebugs.append(closest_ebug)       
        # and then we remove it from the variable that holds the distance that we are going
        # to compare
        ebugs_dist_to_target.remove(ebugs_dist_to_target[closest_ebug])

    return sorted_ebugs


def morsePotentialFunction(command):

    sorted_ebugs = chooseLeader(command)
    ebugs_data = command.robots_position

    num_of_ebugs = len(sorted_ebugs)

    rate = rospy.Rate(0.5)


    while not rospy.is_shutdown():
        tab_delta_x = []
        tab_delta_y = []
        tab_delta_angle = []

        for i in range(num_of_ebugs):
            vec_x = math.cos(ebugs_data[i].angle*math.pi/180.0)
            vec_y = math.sin(ebugs_data[i].angle*math.pi/180.0)
            Fx = 0
            Fy = 0
            Fx_norm = 0
            Fy_norm = 0
            Fmag = 0
            Fmag_norm = 0

            for j in range(num_of_ebugs):
                # we don't need to compare th ref ebug to itself
                if i == j:
                    continue
                
                xref = ebugs_data[i].x
                yref = ebugs_data[i].y
                # we don't put any noise, it is just a demo
                xcurr = ebugs_data[j].x
                ycurr = ebugs_data[j].y

                di0 = math.fabs(xref - xcurr)
                di1 = math.fabs((xref-1) - xcurr)
                di2 = math.fabs((xref+1) - xcurr)

                dj0 = math.fabs(yref - ycurr)
                dj1 = math.fabs((yref - 1) - ycurr)
                dj2 = math.fabs((yref + 1) - ycurr)
                # ici on calcul la distance entre l'ebug de référence et l'ebug courant
                dist = math.sqrt(math.pow(di0, 2) + math.pow(dj0, 2))
                # ici ce sont aussi des distances pemettant d'avoir la moyenne des gradients
                dij1 = math.sqrt(math.pow(di1, 2) + math.pow(dj0, 2))
                dij2 = math.sqrt(math.pow(di2, 2) + math.pow(dj0, 2))

                dji1 = math.sqrt(math.pow(di0, 2) + math.pow(dj1, 2))
                dji2 = math.sqrt(math.pow(di0, 2) + math.pow(dj2, 2))

                # here we compute the Ux gradient to establish a mean
                Ux1 = (-Ca*math.exp(-dij1/la)) + (Cr*math.exp(-dij1/lr))
                Ux2 = (-Ca*math.exp(-dij2/la)) + (Cr*math.exp(-dij2/lr))

                Uxgrad = (Ux1 - Ux2)/2


                Uy1 = (-Ca*math.exp(-dji1/la)) + (Cr*math.exp(-dji1/lr))
                Uy2 = (-Ca*math.exp(-dji2/la)) + (Cr*math.exp(-dji2/lr))

                Uygrad = (Uy1 -Uy2)/2
                # here we compute the force
                Fx += Uxgrad
                Fy += Uygrad
                Fx_norm += (Uxgrad*dist)/40
                Fy_norm += (Uygrad*dist)/40

                vec_x += math.cos(ebugs_data[i].angle*math.pi/180.0)
                vec_y += math.sin(ebugs_data[i].angle*math.pi/180.0)

            # Those two are supposed to be put in a file but I don't really know their use
            Fmag = math.sqrt(math.pow(Fx, 2) + math.pow(Fy, 2))
            Fmag_norm = math.sqrt(math.pow(Fx_norm, 2) + math.pow(Fy_norm, 2))

            avg_angle = math.atan2(vec_y, vec_x)

            linear_speed = Fx_norm*math.cos(ebugs_data[i].angle*math.pi/180.0) + Fy_norm*math.sin(ebugs_data[i].angle*math.pi/180.0)

            linear_speed *= 2000

            if linear_speed > 4000:
                linear_speed = 4000
            elif linear_speed < -4000:
                linear_speed = -4000

            angle_diff = (avg_angle - ebugs_data[i].angle)

            if angle_diff > 180.0:
                angle_diff -= 360.0
            elif angle_diff < - 180.0:
                angle_diff += 360.0
            
            angle_diff = angle_diff*math.pi/180.0

            avg_orientation = Ct*(angle_diff)*1500

            if avg_orientation > 1500:
                avg_orientation = 1500
            elif avg_orientation < -1500:
                avg_orientation = -1500

            polar_moment = Cp*(Fy_norm*math.cos(ebugs_data[i].angle*math.pi/180.0) - Fx_norm*math.sin(ebugs_data[i].angle*math.pi/180.0))

            polar_moment *= 1500

            if polar_moment > 3000:
                polar_moment = 3000
            elif polar_moment < -3000:
                polar_moment = -3000

            rotation_speed = polar_moment + avg_orientation


            right_wheel_speed = round(abs(linear_speed+rotation_speed))
            left_wheel_speed = round(abs(linear_speed-rotation_speed))

            # here we compute the angular velocity of each wheel
            ang_vel_rwheel = right_wheel_speed/wheel_radius
            ang_vel_lwheel = left_wheel_speed/wheel_radius

            ang_vel_rwheel /= 100
            ang_vel_lwheel /= 100

            # then we compute the new position and the new angle of each robot
            delta_x = (wheel_radius/2)*(ang_vel_rwheel*math.cos(ebugs_data[i].angle) + ang_vel_lwheel*math.cos(ebugs_data[i].angle))

            delta_y = (wheel_radius/2)*(ang_vel_rwheel*math.sin(ebugs_data[i].angle) + ang_vel_lwheel*math.sin(ebugs_data[i].angle))

            delta_angle = (wheel_radius/2)*(ang_vel_rwheel/distance_between_wheel - ang_vel_lwheel/distance_between_wheel)

            # rospy.loginfo(rospy.get_caller_id()+ "ebug "+str(i)+ ": linear speed = "+str(linear_speed)+", rotation speed = "+str(rotation_speed))

            # rospy.loginfo(rospy.get_caller_id() + "rws: "+str(right_wheel_speed)+" lws :"+str(left_wheel_speed))

            # rospy.loginfo(rospy.get_caller_id()+ "ebug "+str(i)+ ": delta x - "+str(delta_x)+", delta y - "+str(delta_y)+", delta angle - "+str(delta_angle))

            tab_delta_x.append(delta_x)
            tab_delta_y.append(delta_y)
            tab_delta_angle.append(delta_angle)

        
        for i in range(num_of_ebugs):
            ebugs_data[i].x += tab_delta_x[i]
            ebugs_data[i].y += tab_delta_y[i]
            ebugs_data[i].angle += tab_delta_angle[i]
        
        new_pos = Command()

        for i in range(num_of_ebugs):
            new_pos.robots_position.append(ebugs_data[i])
        
        new_pos.target_position.x = command.target_position.x
        new_pos.target_position.y = command.target_position.y


        publisher.publish(new_pos)

        rate.sleep()




def setup():
    rospy.init_node('morse_control_node', anonymous=True)
    # rospy.Subscriber('command_topic', Command,morsePotentialFunction)
    # rospy.spin()

if __name__ == '__main__':
    publisher = rospy.Publisher('pos_of_ebugs', Command, queue_size=1)
    rospy.init_node('formation_control_node', anonymous=True)
    command = sendingFirstMockGoals()
    morsePotentialFunction(command)


    