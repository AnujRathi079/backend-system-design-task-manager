syntax = "proto3";

service TaskService {

 rpc GetTasks (Empty) returns (TaskList);

 rpc GetTask (TaskRequest) returns (Task);

 rpc CreateTask (CreateTaskRequest) returns (Task);

 rpc DeleteTask (TaskRequest) returns (Empty);

}

