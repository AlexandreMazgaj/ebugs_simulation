// Auto-generated. Do not edit!

// (in-package ebugs_message.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Force {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Fx = null;
      this.Fy = null;
    }
    else {
      if (initObj.hasOwnProperty('Fx')) {
        this.Fx = initObj.Fx
      }
      else {
        this.Fx = 0;
      }
      if (initObj.hasOwnProperty('Fy')) {
        this.Fy = initObj.Fy
      }
      else {
        this.Fy = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Force
    // Serialize message field [Fx]
    bufferOffset = _serializer.int16(obj.Fx, buffer, bufferOffset);
    // Serialize message field [Fy]
    bufferOffset = _serializer.int16(obj.Fy, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Force
    let len;
    let data = new Force(null);
    // Deserialize message field [Fx]
    data.Fx = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [Fy]
    data.Fy = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ebugs_message/Force';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '71daa568e162227b07dbde011fd0127a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 Fx
    int16 Fy
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Force(null);
    if (msg.Fx !== undefined) {
      resolved.Fx = msg.Fx;
    }
    else {
      resolved.Fx = 0
    }

    if (msg.Fy !== undefined) {
      resolved.Fy = msg.Fy;
    }
    else {
      resolved.Fy = 0
    }

    return resolved;
    }
};

module.exports = Force;
