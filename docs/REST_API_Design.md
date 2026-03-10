# REST API Design

## Overview

This document defines the REST API specification for the Student Course Management system.

The system manages:

* Students
* Courses
* Student course enrollment (Study relationship)

Base URL:

/api/v1

# Resource Structure

The main resources of the system are:

Students
Courses
Enrollments (Study relationship)

Example resource paths:

/students
/courses
/enrollments

# CRUD APIs for Students
GET /api/v1/students
# Response

[
 {
   "stu_id":1,
   "stu_name":"Anuj",
   "stu_age":22
 }
]

# status code 
200 OK

 # Get Single Student

 GET /api/v1/students/{id}
# Response

 {
 "stu_id":1,
 "stu_name":"Anuj",
 "stu_age":22
}

# Status
200 OK
404 Not Found

# Create Student
POST /api/v1/students

# Request Body
{
 "stu_name":"Rahul",
 "stu_age":21
}

# Response
204 No Content

# Full Update Student
PUT /api/v1/students/{id}

# Body 
{
 "stu_name":"Rahul Sharma",
 "stu_age":22
}

# Status
200 OK
404 Not Found

# Partial Update Student
PATCH /api/v1/students/{id}

{
 "stu_age":23
}

# Status 
200 OK

# Delete Student
DELETE /api/v1/students/{id}

# Response
204 No Content

# CRUD APIs for Courses

GET /api/v1/courses

# Response
[
 {
  "cou_id":1,
  "cou_name":"Database Systems"
 }
]

# Create Course
POST /api/v1/courses

{
 "cou_name":"Operating Systems"
}

# Response
204 No Content

# Nested Resources
Get Courses of a Student

GET /api/v1/students/{stu_id}/courses

# Response
[
 {
   "cou_id":1,
   "cou_name":"Database Systems"
 }
]

# Enroll Student to Course
POST /api/v1/students/{stu_id}/courses/{cou_id}

# Response
201 Created

# Search Endpoint
GET /api/v1/students?age=21

# Long Running Job Endpoint
POST /api/v1/reports/student-course-report

# Response
202 Accepted

{
 "job_id":"65865",
 "status":"processing"
}

# Error Responses
Bad Request

# Status

400 Bad Request

# Response
{
 "error":"Invalid student age"
}

404 Not Found

# Server Error
500 Internal Server Error

# API Versioning Strategy

v1 → basic CRUD APIs
v2 → pagination, filtering, analytics

# API Structure
/api/v1/students
/api/v2/students

