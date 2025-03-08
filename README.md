Welcome to My Api

## Task
The goal of this project is to create a comprehensive API backend for managing Earthquake Information, allowing users to interact with a dataset of over 1,000 rows. The challenge is to implement user authentication with OAuth, provide CRUD operations with pagination, enable caching with Redis, and optionally, offer a GraphQL interface. Finally, the project will be hosted on a cloud provider with a free tier.

## Description
This project solves the problem by developing a RESTful API using Ruby on Rails to manage Earthquake data. The API allows users to perform Create, Read, Update, and Delete (CRUD) operations.

Key Features:
User Authentication: Users can register and log in using OAuth, ensuring secure access to data administration features.
CRUD Operations: The API supports GET, POST, UPDATE, and DELETE operations. The GET endpoint is publicly accessible and paginated, displaying a maximum of 20 items per page.
Caching: Redis is used to cache frequently accessed data, improving response times and reducing server load.
GraphQL Interface (Optional): An alternative GraphQL API is provided for flexible querying.
Documentation: API documentation is generated using Swagger, and a Postman collection is available for testing.
The backend is hosted on IBM, taking advantage of their free tier to minimize costs.

## Installation
Clone the repository:
git clone https://git.us.qwasar.io/nsikan-o_e/My_API.git
cd yourproject
npm install
gem install rails
rails server

## Usage
Once the application is running, you can access the API at http://localhost:3000.

API Endpoints:
GET /api/v1/earthquakes: Retrieve a paginated list of items.
POST /api/v1: Create a new item (requires authentication).
PUT /api/v1/{id}: Update an existing item (requires authentication).
DELETE /api/v1/{id}: Delete an item (requires authentication).
Running the Application:
To interact with the API, use the provided Postman collection or access the Swagger documentation at http://localhost:3000/api-docs/index.html.
curl http://localhost:3000/api/v1/earthquakes

Deployment
The application is hosted on render.com, and you can access it at: 

Developed by: Essoh Nsikan Okon

