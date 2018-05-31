// Auto-generated. Do not edit!

// (in-package ebugs_message.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Force = require('./Force.js');

//-----------------------------------------------------------

class Vector {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.force = null;
      this.angle = null;
    }
    else {
      if (initObj.hasOwnProperty('force')) {
        this.force = initObj.force
      }
      else {
        this.force = new Force();
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Vector
    // Serialize message field [force]
    bufferOffset = Force.serialize(obj.force, buffer, bufferOffset);
    // Serialize message field [angle]
    bufferOffset = _serializer.int16(obj.angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Vector
    let len;
    let data = new Vector(null);
    // Deserialize message field [force]
    data.force = Force.deserialize(buffer, bufferOffset);
    // Deserialize message field [angle]
    data.angle = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ebugs_message/Vector';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'de12e8b051979070b0599ae0a684ea10';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Force force
    int16 angle
    ================================================================================
    MSG: ebugs_message/Force
    int16 Fx
    int16 Fy
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Vector(null);
    if (msg.force !== undefined) {
      resolved.force = Force.Resolve(msg.force)
    }
    else {
      resolved.force = new Force()
    }

    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0
    }

    return resolved;
    }
};

module.exports = Vector;
