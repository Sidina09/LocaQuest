## Local Quest
Local Quest is a Rails API project designed to manage users, questions, and answers. It provides endpoints to perform CRUD operations on these resources.

## Getting Started
To set up and run the project locally, follow these steps:

Clone the Repository:

bash
Copy code
git clone <repository-url>
Install Dependencies:

bash
Copy code
bundle install
Set Up MongoDB:

Make sure you have MongoDB installed on your local machine.
Configure the development and test databases in config/mongoid.yml.
Run Migrations:

bash
Copy code
rails db:create
rails db:migrate
Start the Server:

bash
Copy code
rails server
Now you can access the API endpoints locally.

## API Endpoints
Users
GET /users: Retrieve all users.
POST /users: Create a new user.
Questions
GET /questions: Retrieve all questions.
POST /questions: Create a new question.
Answers
GET /answers: Retrieve all answers.
POST /answers: Create a new answer.
Database Configuration
The project uses MongoDB as the database. Here's the configuration for development and test environments in config/mongoid.yml:

yaml
Copy code
development:
  clients:
    default:
      database: loca_quest
      hosts:
        - localhost:27017
      options:
        # Add your MongoDB options here

test:
  clients:
    default:
      database: loca_quest_test
      hosts:
        - localhost:27017
      options:
        # Add your MongoDB options here
Make sure to adjust the database settings based on your local MongoDB setup.

## Dependencies
Ruby: 3.2.3
Rails: 7.1.3
Mongoid: MongoDB ODM for Rails
rack-cors: Middleware for handling Cross-Origin Resource Sharing (CORS)
jwt: JSON Web Token implementation for Ruby
sprockets-rails: Original asset pipeline for Rails
puma: Web server for Ruby applications
importmap-rails: JavaScript with ESM import maps
turbo-rails: Hotwire's SPA-like page accelerator
stimulus-rails: Hotwire's modest JavaScript framework
jbuilder: Build JSON APIs with ease
bootsnap: Reduces boot times through caching

## License
This project is licensed under the MIT License.
