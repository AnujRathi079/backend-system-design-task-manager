# gRPC Design

## Overview

This document defines the gRPC service specification for the Student Course Management system.

gRPC is a high-performance RPC framework developed by Google that uses Protocol Buffers (protobuf) for serialization.

The system provides services for managing:

* Students
* Courses
* Student enrollments


## Proto Definition

The gRPC services are defined using Protocol Buffers (.proto files).

Below is the service definition for the application.


# Proto 

syntax = "proto3";

package studentcourse;


# message Student {

  int32 stu_id = 1;

  string stu_name = 2;

  int32 stu_age = 3;

}

message Course {

  int32 cou_id = 1;

  string cou_name = 2;

}

message Enrollment {

  int32 id = 1;

  int32 stu_id = 2;

  int32 cou_id = 3;

}

# Request Messagemessage StudentRequest {

  int32 stu_id = 1;

}

message CreateStudentRequest {

  string stu_name = 1;

  int32 stu_age = 2;

}

message CourseRequest {

  int32 cou_id = 1;

}

# Response 
message StudentList {

  repeated Student students = 1;

}

message CourseList {

  repeated Course courses = 1;

}

# Service Defination 
service StudentService {

  rpc GetStudents (google.protobuf.Empty) returns (StudentList);

  rpc GetStudent (StudentRequest) returns (Student);

  rpc CreateStudent (CreateStudentRequest) returns (Student);

  rpc DeleteStudent (StudentRequest) returns (google.protobuf.Empty);

}

service CourseService {

  rpc GetCourses (google.protobuf.Empty) returns (CourseList);

  rpc GetCourse (CourseRequest) returns (Course);

}

service EnrollmentService {

  rpc EnrollStudent (Enrollment) returns (Enrollment);

}

# Explanation 
Service Explanation

StudentService
Handles operations related to students such as listing students, retrieving a student, creating and deleting students.

CourseService
Handles operations related to courses.

EnrollmentService
Handles student enrollment in courses.

## Advantages of gRPC

* High performance communication
* Uses Protocol Buffers (smaller payload size)
* Supports multiple languages
* Ideal for microservices communication


