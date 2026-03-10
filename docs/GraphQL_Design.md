# Schema 
type User {
 id: ID!
 name: String
 email: String
}

type Task {
 id: ID!
 title: String
 description: String
 status: String
 priority: String
 comments: [TaskComment]
 tags: [Tag]
}

type Query {
 tasks: [Task]
 task(id:ID): Task
 users: [User]
}

# Mutations

createTask
updateTask
deleteTask
addComment
addTagToTask

