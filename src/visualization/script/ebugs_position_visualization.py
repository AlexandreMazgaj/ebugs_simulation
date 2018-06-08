#!/usr/bin/env python
# coding=utf-8

import rospy
import math
from ebugs_message.msg import Force
from ebugs_message.msg import Position
from ebugs_message.msg import Command
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Pose, Point, Vector3, Quaternion
from std_msgs.msg import Header, ColorRGBA


def fromEbugsToRviz(command):
    marker_publisher = rospy.Publisher('visualization_marker', Marker)
    all_the_markers = []

    num_of_ebugs = len(command.robots_position)
    ebugs_data = command.robots_position

    for i in range(num_of_ebugs):
        marker = Marker(type=3,
                        id=i,
                        lifetime=rospy.Duration(3),
                        pose=Pose(Point(ebugs_data[i].x, ebugs_data[i].y, 0), Quaternion(0, 0, 0, 0)),
                        scale=Vector3(0.6, 0.6, 0.5),
                        header=Header(frame_id='base_link'),
                        color=ColorRGBA(1.0, 0.0, 0.0, 1.0))
        all_the_markers.append(marker)

    for i in range(num_of_ebugs):
        marker_publisher.publish(all_the_markers[i])



def setup():
    rospy.init_node('ebugs_position_visualization', anonymous=True)
    rospy.Subscriber('pos_of_ebugs', Command, fromEbugsToRviz)
    rospy.spin()


if __name__ == "__main__":
    setup()