# Rest API
/api/v1

# User APIs

GET /users
GET /users/{id}
POST /users
PUT /users/{id}
DELETE /users/{id}

# Tasks APIs
GET /tasks
GET /tasks/{id}
POST /tasks
PUT /tasks/{id}
PATCH /tasks/{id}
DELETE /tasks/{id}

# Search Tasks
GET /tasks?status=open
GET /tasks?priority=high

# Comments under tasks
GET /tasks/{task_id}/comments
POST /tasks/{task_id}/comments

# Tags
GET /tags
POST /tags

# Task Tags
POST /tasks/{task_id}/tags/{tag_id}
DELETE /tasks/{task_id}/tags/{tag_id}

POST /tasks/export

# Status 
202 Accepted