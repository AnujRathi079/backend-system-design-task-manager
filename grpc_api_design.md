
# gRPC Service Design – Task Manager

gRPC (Google Remote Procedure Call) is a high-performance API communication framework developed by Google.

It allows different services (client and server) to communicate with each other faster and more efficiently than traditional REST APIs.

Instead of using JSON like REST, gRPC uses Protocol Buffers (Protobuf) which are binary and smaller in size, making communication faster.

gRPC services define communication using Protocol Buffers.

File: task.proto

---

syntax = "proto3";

package taskmanager;

service TaskService {

 rpc ListTasks (Empty) returns (TaskList);

 rpc GetTask (TaskRequest) returns (Task);

 rpc CreateTask (CreateTaskRequest) returns (Empty);

 rpc UpdateTask (UpdateTaskRequest) returns (Task);

 rpc DeleteTask (TaskRequest) returns (Empty);

}

message Empty {}

message Task {
 string id = 1;
 string title = 2;
 string description = 3;
 string status = 4;
}

message TaskRequest {
 string id = 1;
}

message CreateTaskRequest {
 string title = 1;
 string description = 2;
}

message UpdateTaskRequest {
 string id = 1;
 string title = 2;
 string status = 3;
}

message TaskList {
 repeated Task tasks = 1;
}


# Advantages of gRPC

Faster than REST

Uses HTTP/2

Binary serialization

Strong contract using protobuf

# grpc Flow 
Client Application
        ↓
gRPC Client
        ↓
HTTP/2 Connection
        ↓
gRPC Server
        ↓
Database

