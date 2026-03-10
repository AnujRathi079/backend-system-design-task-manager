# JWT Authentication Design

## Overview

This document describes the JSON Web Token (JWT) based authentication mechanism for the Student Course Management system.

JWT is used to securely authenticate users and allow them to access protected API endpoints.

The authentication process ensures that only authorized users can perform operations such as creating students, enrolling courses, or updating records.


## Authentication Flow

1. User logs in with credentials (email and password).
2. Server verifies the credentials.
3. Server generates a JWT token.
4. Token is returned to the client.
5. Client includes the token in API requests.
6. Server validates the token before allowing access to protected resources.

Authorization: Bearer <JWT_TOKEN>

## JWT Structure

A JWT token consists of three parts:

Header
Payload
Signature

Example:

xxxxx.yyyyy.zzzzz

Header → algorithm and token type
Payload → claims (user information)
Signature → verifies token integrity

## JWT Claims

The following claims are used in the application:

| Claim | Description               |
| ----- | ------------------------- |
| sub   | User ID                   |
| email | User email                |
| role  | User role (admin or user) |
| iat   | Token issued time         |
| exp   | Token expiration time     |

{
 "sub": "101",
 "email": "student@example.com",
 "role": "student",
 "iat": 1710000000,
 "exp": 1710003600
}

| Field | Meaning            |
| ----- | ------------------ |
| sub   | user identifier    |
| email | user email         |
| role  | authorization role |
| iat   | issued time        |
| exp   | expiry time        |

## Protected APIs

POST /api/v1/students
PUT /api/v1/students/{id}
DELETE /api/v1/students/{id}
POST /api/v1/students/{stu_id}/courses/{cou_id}

## Token Expiration Strategy

Access Token Expiry: 1 hour

If the token expires, the user must authenticate again to obtain a new token.

Short expiration improves security and reduces the risk of token misuse.


## Security Best Practices

* Tokens should be transmitted using HTTPS.
* Secret keys must be securely stored on the server.
* Tokens should have limited expiration time.
* Sensitive information should not be stored in JWT payload.

