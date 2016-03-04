# simple-check-in

Welcome to the Checkin API!

1. [Overview](#overview)
2. [How Does It Work](#how-does-it-work)
3. [Endpoints](#endpoints)
4. [Development](#development)
5. [Extra Links](#extra-links)

### Overview

This is an API which allows a user to find a business and check in to it! The API will save each checkin in the database, so that statistics on each business and each user is easily produced. 

### How Does It Work

The database consists of three models. It can store users, businesses, and checkins. The checkin table has two main columns which are inputed by the client each time the user checks in: user_id, and business_id. This way, each checkin can be stored, and can be ordered by the created_at date that active record so kindly provides us with.  

### Endpoints

There are two endpoints. 

1.businesses

For a list of all businesses in the database, go to '/businesses'. To retrieve a business with id = 1, go to '/businesses/1' 

You can also perform basic CRUD operations via POST and PATCH requests. However, only businesses with a name, phone_number, and address present will be saved into the database. 

2. Checkins

For a list of all Checkins in the database, go to '/checkins'. To retrieve a checkin with id = 1, go to '/checkins/1'.

You can create a checkin with a POST request. Just give it the parameters of the user_id, and the business_id. Both of these parameters must be present for the checkin to save properly. 

### Development
After cloning the repository, bundle to make sure you have all needed gems installed by opening your terminal and running
```
bundle install
```

Next set up the database by running
```
rake db:reset
```
To make sure everything is running properly run the tests with
```
rspec spec

```

To populate the database with 500 fake businesses and 10 fake users, run rake db:seed!

### Extra Links

Fake data is generated with the gem 'faker'

Documentation for this gem can be found at

- [Link to documentation](https://github.com/stympy/faker)
