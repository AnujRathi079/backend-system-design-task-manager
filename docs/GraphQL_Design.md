# GraphQL_Design.md

GraphQL is a query language for APIs and a runtime for executing those queries. It allows clients (frontend or other services) to request exactly the data they need from the server, nothing more and nothing less.

Endpoint
/graphql

# Scema Defination 
type Task {
  id: ID!
  title: String!
  description: String
  status: String
  comments: [Comment]
}

type Comment {
  id: ID!
  message: String!
}

type Query {
  tasks: [Task]
  task(id: ID!): Task
}

type Mutation {
  createTask(title: String!, description: String): Task
  updateTask(id: ID!, title: String, status: String): Task
  deleteTask(id: ID!): Boolean
}

# Example Query
query {
 tasks {
  id
  title
  status
 }
}

# Response 
{
 "data":{
  "tasks":[
   {
    "id":"1",
    "title":"Complete project",
    "status":"pending"
   }
  ]
 }
}

# Mutation 

mutation {
 createTask(title:"New Task", description:"Testing GraphQL") 
 {
  id
  title
 }
}