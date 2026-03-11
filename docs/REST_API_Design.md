# REST API Design – Task Manager Application

REST API (Representational State Transfer API) is a way for different applications to communicate with each other over the internet using HTTP requests.

In simple terms:
A REST API allows a client (frontend/mobile app) to interact with a server (backend/database) to create, read, update, or delete data.

REST APIs follow specific design principles and use HTTP methods like GET, POST, PUT, PATCH, and DELETE.


Base URL: https://api.taskmanager.com/api/v1

# Resource Structure

| Resource | Description                   |
| -------- | ----------------------------- |
| Users    | Application users             |
| Tasks    | Tasks created by users        |
| Comments | Comments on tasks             |
| Jobs     | Long-running background tasks |

# Relationship:

One User can create many Tasks

One Task can have many Comments

User → Tasks → Comments

# API URL Structure & Methods

| Method | Endpoint         | Description      |
| ------ | ---------------- | ---------------- |
| GET    | /tasks           | List all tasks   |
| GET    | /tasks/{id}      | Get task by ID   |
| GET    | /tasks/search?q= | Search tasks     |
| POST   | /tasks           | Create task      |
| PUT    | /tasks/{id}      | Full update task |
| PATCH  | /tasks/{id}      | Partial update   |
| DELETE | /tasks/{id}      | Delete task      |

# CRUD Endpoints

List Tasks

GET /tasks

# Response 
[
 {
   "id":1,
   "title":"Complete Assignment",
   "status":"pending"
 }
]

# Status 
200 OK

# Get Task

GET /tasks/{id}

# Response
{
 "id":1,
 "title":"Complete Assignment",
 "description":"Finish REST API design",
 "status":"pending"
}

# Status 
200 OK
404 Not Found

# Create Task

POST /tasks

# Request 
{
 "title":"Complete Assignment",
 "description":"Finish API documentation"
}

# Response 
204 No Content

# Update Task

PUT/tasks/{id}

# Request 
{
 "title":"Complete Assignment",
 "description":"Finish documentation",
 "status":"completed"
}

# Response 
200 OK
404 Not Found

# Partial Update
PATCH /tasks/{id}

# Request 
{
 "status":"completed"
}

# Response 
200 OK

# Delete Task
DELETE /tasks/{id}

# Response 
204 No Content

# Nested Resource

Comments belong to Tasks.

# Endpoint:
GET /tasks/{taskId}/comments

# Response
[
 {
  "id":1,
  "message":"Please complete by tomorrow"
 }
]

# Create Comments
POST /tasks/{taskId}/comments
 

# Search Endpoint
Search tasks by keyword.

GET /tasks/search?q=assignment

# Response
[
 {
  "id":2,
  "title":"Assignment submission"
 }
]

# Long Running Job Endpoint

Start job
POST /jobs/report

# Response
{
 "job_id":"12345",
 "status":"processing"
}

# Check job status
GET /jobs/{job_id}

# Response
{
 "job_id":"12345",
 "status":"completed"
}

# HTTP Status Code 
| Code | Meaning               |
| ---- | --------------------- |
| 200  | Success               |
| 201  | Resource Created      |
| 204  | No Content            |
| 400  | Bad Request           |
| 401  | Unauthorized          |
| 404  | Resource Not Found    |
| 500  | Internal Server Error |

# Error  Response 
{
 "error":"Invalid request data"
}


