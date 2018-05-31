// Auto-generated. Do not edit!

// (in-package ebugs_message.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Position = require('./Position.js');

//-----------------------------------------------------------

class Command {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.robots_position = null;
      this.target_position = null;
    }
    else {
      if (initObj.hasOwnProperty('robots_position')) {
        this.robots_position = initObj.robots_position
      }
      else {
        this.robots_position = [];
      }
      if (initObj.hasOwnProperty('target_position')) {
        this.target_position = initObj.target_position
      }
      else {
        this.target_position = new Position();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Command
    // Serialize message field [robots_position]
    // Serialize the length for message field [robots_position]
    bufferOffset = _serializer.uint32(obj.robots_position.length, buffer, bufferOffset);
    obj.robots_position.forEach((val) => {
      bufferOffset = Position.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [target_position]
    bufferOffset = Position.serialize(obj.target_position, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Command
    let len;
    let data = new Command(null);
    // Deserialize message field [robots_position]
    // Deserialize array length for message field [robots_position]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.robots_position = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.robots_position[i] = Position.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [target_position]
    data.target_position = Position.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 6 * object.robots_position.length;
    return length + 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ebugs_message/Command';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4f354046c8f89b31b50f4af3a1191dee';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Position[] robots_position
    Position target_position
    ================================================================================
    MSG: ebugs_message/Position
    int16 x
    int16 y
    int16 angle
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Command(null);
    if (msg.robots_position !== undefined) {
      resolved.robots_position = new Array(msg.robots_position.length);
      for (let i = 0; i < resolved.robots_position.length; ++i) {
        resolved.robots_position[i] = Position.Resolve(msg.robots_position[i]);
      }
    }
    else {
      resolved.robots_position = []
    }

    if (msg.target_position !== undefined) {
      resolved.target_position = Position.Resolve(msg.target_position)
    }
    else {
      resolved.target_position = new Position()
    }

    return resolved;
    }
};

module.exports = Command;
