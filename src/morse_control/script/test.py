#!/usr/bin/env python
# coding=utf-8

import rospy
import math
import random
from ebugs_message.msg import Force
from ebugs_message.msg import Position
from ebugs_message.msg import Command


def test(publisher):
    command = Command()
    
    ebug1 = Position()
    ebug1.x = 1
    ebug1.y = 1
    ebug1.angle = 40

    ebug2 = Position()
    ebug2.x = 3
    ebug2.y = 3
    ebug2.angle = 180

    command.robots_position.append(ebug1)
    command.robots_position.append(ebug2)

    rate = rospy.Rate(0.5)

    while not rospy.is_shutdown():
        publisher.publish(command)
        rate.sleep()


if __name__=="__main__":
    rospy.init_node('test_node', anonymous=True)
    publisher = rospy.Publisher('pos_of_ebugs', Command,queue_size=1)
    test(publisher)



