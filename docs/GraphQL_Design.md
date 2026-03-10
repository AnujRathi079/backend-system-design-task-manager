# GraphQL Design

## Overview

This document describes the GraphQL API design for the Student Course Management system.

The system manages:

* Students
* Courses
* Student enrollments (study relationship)

GraphQL allows clients to request only the required data and supports flexible queries.

## GraphQL Schema

type Student {
  stu_id: ID!
  stu_name: String!
  stu_age: Int
  courses: [Course]
}

type Course {
  cou_id: ID!
  cou_name: String!
  students: [Student]
}

type Enrollment {
  id: ID!
  student: Student
  course: Course
}

## Queries

type Query {

  students: [Student]

  student(id: ID!): Student

  courses: [Course]

  course(id: ID!): Course

}

| Query       | Purpose        |
| ----------- | -------------- |
| students    | all students   |
| student(id) | single student |
| courses     | all courses    |
| course(id)  | single course  |


## Mutations

type Mutation {

  createStudent(name: String!, age: Int!): Student

  updateStudent(id: ID!, name: String, age: Int): Student

  deleteStudent(id: ID!): Boolean

  createCourse(name: String!): Course

  enrollStudent(studentId: ID!, courseId: ID!): Enrollment

}

| Mutation      | Purpose                   |
| ------------- | ------------------------- |
| createStudent | add new student           |
| updateStudent | update student            |
| deleteStudent | remove student            |
| createCourse  | add course                |
| enrollStudent | student course enrollment |

query {
  students {
    stu_name
    stu_age
  }
}

# Response
{
 "data": {
   "students": [
     {
       "stu_name": "Anuj",
       "stu_age": 22
     }
   ]
 }
}

# mutation {
 createStudent(name:"Rahul", age:21){
   stu_id
   stu_name
 }
}

# Response
{
 "data": {
   "createStudent": {
     "stu_id": 5,
     "stu_name": "Rahul"
   }
 }
}

# ## Advantages of GraphQL

- Clients can request only required fields
- Reduces over-fetching and under-fetching
- Single endpoint for multiple resources
- Flexible query structure

