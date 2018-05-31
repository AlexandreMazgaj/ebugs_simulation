# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ebugs_message: 4 messages, 0 services")

set(MSG_I_FLAGS "-Iebugs_message:/home/alexandre/ebugs_ws/src/ebugs_message/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ebugs_message_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Position.msg" NAME_WE)
add_custom_target(_ebugs_message_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ebugs_message" "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Position.msg" ""
)

get_filename_component(_filename "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Command.msg" NAME_WE)
add_custom_target(_ebugs_message_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ebugs_message" "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Command.msg" "ebugs_message/Position"
)

get_filename_component(_filename "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Force.msg" NAME_WE)
add_custom_target(_ebugs_message_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ebugs_message" "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Force.msg" ""
)

get_filename_component(_filename "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Vector.msg" NAME_WE)
add_custom_target(_ebugs_message_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ebugs_message" "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Vector.msg" "ebugs_message/Force"
)

#
#  langs = gencpp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ebugs_message
  "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ebugs_message
)
_generate_msg_cpp(ebugs_message
  "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Position.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ebugs_message
)
_generate_msg_cpp(ebugs_message
  "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Force.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ebugs_message
)
_generate_msg_cpp(ebugs_message
  "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Vector.msg"
  "${MSG_I_FLAGS}"
  "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Force.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ebugs_message
)

### Generating Services

### Generating Module File
_generate_module_cpp(ebugs_message
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ebugs_message
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ebugs_message_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ebugs_message_generate_messages ebugs_message_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Position.msg" NAME_WE)
add_dependencies(ebugs_message_generate_messages_cpp _ebugs_message_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Command.msg" NAME_WE)
add_dependencies(ebugs_message_generate_messages_cpp _ebugs_message_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Force.msg" NAME_WE)
add_dependencies(ebugs_message_generate_messages_cpp _ebugs_message_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Vector.msg" NAME_WE)
add_dependencies(ebugs_message_generate_messages_cpp _ebugs_message_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ebugs_message_gencpp)
add_dependencies(ebugs_message_gencpp ebugs_message_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ebugs_message_generate_messages_cpp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ebugs_message
  "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ebugs_message
)
_generate_msg_nodejs(ebugs_message
  "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Position.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ebugs_message
)
_generate_msg_nodejs(ebugs_message
  "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Force.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ebugs_message
)
_generate_msg_nodejs(ebugs_message
  "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Vector.msg"
  "${MSG_I_FLAGS}"
  "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Force.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ebugs_message
)

### Generating Services

### Generating Module File
_generate_module_nodejs(ebugs_message
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ebugs_message
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ebugs_message_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ebugs_message_generate_messages ebugs_message_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Position.msg" NAME_WE)
add_dependencies(ebugs_message_generate_messages_nodejs _ebugs_message_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Command.msg" NAME_WE)
add_dependencies(ebugs_message_generate_messages_nodejs _ebugs_message_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Force.msg" NAME_WE)
add_dependencies(ebugs_message_generate_messages_nodejs _ebugs_message_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Vector.msg" NAME_WE)
add_dependencies(ebugs_message_generate_messages_nodejs _ebugs_message_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ebugs_message_gennodejs)
add_dependencies(ebugs_message_gennodejs ebugs_message_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ebugs_message_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ebugs_message
  "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ebugs_message
)
_generate_msg_py(ebugs_message
  "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Position.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ebugs_message
)
_generate_msg_py(ebugs_message
  "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Force.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ebugs_message
)
_generate_msg_py(ebugs_message
  "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Vector.msg"
  "${MSG_I_FLAGS}"
  "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Force.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ebugs_message
)

### Generating Services

### Generating Module File
_generate_module_py(ebugs_message
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ebugs_message
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ebugs_message_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ebugs_message_generate_messages ebugs_message_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Position.msg" NAME_WE)
add_dependencies(ebugs_message_generate_messages_py _ebugs_message_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Command.msg" NAME_WE)
add_dependencies(ebugs_message_generate_messages_py _ebugs_message_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Force.msg" NAME_WE)
add_dependencies(ebugs_message_generate_messages_py _ebugs_message_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alexandre/ebugs_ws/src/ebugs_message/msg/Vector.msg" NAME_WE)
add_dependencies(ebugs_message_generate_messages_py _ebugs_message_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ebugs_message_genpy)
add_dependencies(ebugs_message_genpy ebugs_message_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ebugs_message_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ebugs_message)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ebugs_message
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ebugs_message_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ebugs_message)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ebugs_message
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ebugs_message_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ebugs_message)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ebugs_message\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ebugs_message
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ebugs_message_generate_messages_py std_msgs_generate_messages_py)
endif()
