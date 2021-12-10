# [Elearnio challenge](https://github.com/AbhishekSony/elearnio_challenge)

##### Prerequisites

The setups steps expect following tools installed on the system.

- Ruby [3.0](#)
- Rails [6.1](#)

##### 1. Check out the repository

```bash
git clone https://github.com/AbhishekSony/elearnio_challenge.git
```

##### 2. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

```bash
cp config/database.yml.sample config/database.yml
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000

##### 5  Routes for API's
  * Get more details about API's request response ['jsonapi-resources'](https://github.com/cerebris/jsonapi-resources)

- GET /api/v1/courses -> maps to `courses_controller#index` (returns all courses)
   For filtering the post pass the filter attributes in params
   Ex:  GET '/api/v1/courses', params: { filter: { self_assignable: false } }

- GET /api/v1/courses/id -> maps to `courses_controller#show` (returns single course)
- POST /api/v1/courses -> maps to `courses_controller#create` (creates course)
      Ex: 
      Request perameters: 
      `{
        "data": {
          "type": "courses",
          "attributes": {
            "Name": "My course",
            "coach_id": "1"
          }
        }
      }`

#### 6 Run rspec
```ruby
rspec .
```

#### Note

  As per the requirment: 
   ##### A coach can be removed/deleted, transfer the course to another coach in case the deleted coach is responsible for a course.
  - A coach can be deleted from the course. But if the course has already coach available coach cannot be deleted. 
