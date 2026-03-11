# JWT Authentication Design – Task Manager Application

JWT (JSON Web Token) is a secure method used to authenticate users in APIs.

After a user logs in, the server generates a JWT token and sends it to the client.  
The client must include this token in every protected API request.

JWT structure contains three parts:

Header.Payload.Signature

Example Token

eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9
.
eyJ1c2VySWQiOjEsImVtYWlsIjoidXNlckBnbWFpbC5jb20ifQ
.
signaturekey

---

# 2. Authentication Flow

Step 1  
User sends login request.

POST /auth/login

Request

{
 "email": "user@gmail.com",
 "password": "123456"
}

Step 2  
Server validates credentials.

Step 3  
Server generates JWT token.

Response

{
 "token": "JWT_TOKEN"
}

Step 4  
Client stores token (localStorage or cookies).

Step 5  
Client sends token in every protected request.

Authorization Header

Authorization: Bearer JWT_TOKEN

---

# 3. Protected API Endpoints

The following endpoints require authentication.

| Endpoint | Description |
|--------|-------------|
| POST /tasks | Create task |
| PUT /tasks/{id} | Update task |
| PATCH /tasks/{id} | Partial update |
| DELETE /tasks/{id} | Delete task |
| POST /tasks/{taskId}/comments | Add comment |

Public endpoints

| Endpoint | Description |
|------|------|
| POST /auth/login | User login |
| POST /auth/register | User registration |
| GET /tasks | View tasks |

---

# 4. JWT Payload Example

The payload contains user information.

{
 "userId": 1,
 "email": "user@gmail.com",
 "role": "user",
 "exp": 1712345678
}

Fields explanation

| Field | Description |
|------|------|
| userId | Unique user identifier |
| email | User email |
| role | User role |
| exp | Token expiration time |

---

# 5. Token Verification

Every protected request must include the JWT token.

Example request

GET /tasks

Headers

Authorization: Bearer JWT_TOKEN

Server verifies

- token signature
- expiration time
- user identity

If valid → request proceeds  
If invalid → request rejected

---

# 6. Error Responses

Invalid token

401 Unauthorized

Response

{
 "error": "Invalid or expired token"
}

Missing token

401 Unauthorized

Response

{
 "error": "Authentication required"
}

---

# 7. Security Best Practices

To ensure secure authentication:

- Use HTTPS for all API communication
- Keep JWT secret key secure
- Use token expiration
- Implement refresh tokens
- Validate token on every request

---

# 8. JWT Advantages

- Stateless authentication
- Scalable for microservices
- Secure token verification
- Works well with REST APIs
- Reduces database lookups



