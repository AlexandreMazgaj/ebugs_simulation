// Generated by gencpp from file ebugs_message/Vector.msg
// DO NOT EDIT!


#ifndef EBUGS_MESSAGE_MESSAGE_VECTOR_H
#define EBUGS_MESSAGE_MESSAGE_VECTOR_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <ebugs_message/Force.h>

namespace ebugs_message
{
template <class ContainerAllocator>
struct Vector_
{
  typedef Vector_<ContainerAllocator> Type;

  Vector_()
    : force()
    , angle(0)  {
    }
  Vector_(const ContainerAllocator& _alloc)
    : force(_alloc)
    , angle(0)  {
  (void)_alloc;
    }



   typedef  ::ebugs_message::Force_<ContainerAllocator>  _force_type;
  _force_type force;

   typedef int16_t _angle_type;
  _angle_type angle;




  typedef boost::shared_ptr< ::ebugs_message::Vector_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ebugs_message::Vector_<ContainerAllocator> const> ConstPtr;

}; // struct Vector_

typedef ::ebugs_message::Vector_<std::allocator<void> > Vector;

typedef boost::shared_ptr< ::ebugs_message::Vector > VectorPtr;
typedef boost::shared_ptr< ::ebugs_message::Vector const> VectorConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ebugs_message::Vector_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ebugs_message::Vector_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace ebugs_message

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'ebugs_message': ['/home/alexandre/ebugs_ws/src/ebugs_message/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::ebugs_message::Vector_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ebugs_message::Vector_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ebugs_message::Vector_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ebugs_message::Vector_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ebugs_message::Vector_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ebugs_message::Vector_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ebugs_message::Vector_<ContainerAllocator> >
{
  static const char* value()
  {
    return "de12e8b051979070b0599ae0a684ea10";
  }

  static const char* value(const ::ebugs_message::Vector_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xde12e8b051979070ULL;
  static const uint64_t static_value2 = 0xb0599ae0a684ea10ULL;
};

template<class ContainerAllocator>
struct DataType< ::ebugs_message::Vector_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ebugs_message/Vector";
  }

  static const char* value(const ::ebugs_message::Vector_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ebugs_message::Vector_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Force force\n\
int16 angle\n\
================================================================================\n\
MSG: ebugs_message/Force\n\
int16 Fx\n\
int16 Fy\n\
";
  }

  static const char* value(const ::ebugs_message::Vector_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ebugs_message::Vector_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.force);
      stream.next(m.angle);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Vector_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ebugs_message::Vector_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ebugs_message::Vector_<ContainerAllocator>& v)
  {
    s << indent << "force: ";
    s << std::endl;
    Printer< ::ebugs_message::Force_<ContainerAllocator> >::stream(s, indent + "  ", v.force);
    s << indent << "angle: ";
    Printer<int16_t>::stream(s, indent + "  ", v.angle);
  }
};

} // namespace message_operations
} // namespace ros

#endif // EBUGS_MESSAGE_MESSAGE_VECTOR_H