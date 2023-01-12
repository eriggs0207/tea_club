# README

# Tea Club API

## Table of Contents

1. [About Tea Club](#about-tea-club)
2. [Built With](#built-with)
- [Gems](#gems)
- [Versions](#versions)
3. [Local Setup](#local-setup)
4. [Database Schema](#database-schema)
5. [Available RESTful API End Points](#all-available-end-points)
- [Subscriptions End Points](#subscriptions-end-points)
    - [Create](#favorites-create)
    - [Update](#favorites-update)
    - [Index](#favorites-index)
6. [Contributors](#contributors)

## About Tea Club

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

## Built With

![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![Ruby on Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Git](https://img.shields.io/badge/GIT-E44C30?style=for-the-badge&logo=git&logoColor=white)
![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white)

### Gems

![rspec](https://img.shields.io/gem/v/rspec-rails?label=rspec&style=flat-square)
![jsonapi-serializer](https://img.shields.io/badge/jsonapi--serializer-v%202.2.0-green)
![shoulda](https://img.shields.io/gem/v/shoulda-matchers?label=shoulda-matchers&style=flat-square)
![simplecov](https://img.shields.io/gem/v/simplecov?label=simplecov&style=flat-square)
![factory bot](https://img.shields.io/gem/v/factory_bot_rails?color=blue&label=factory_bot_rails)
![faker](https://img.shields.io/gem/v/faker?color=blue&label=faker)
![rubocop](https://img.shields.io/gem/v/rubocop?color=blue&label=rubocop)
![pry](https://img.shields.io/gem/v/pry?color=blue&label=pry)

### Versions

This project uses `Ruby 2.7.2`

- with Rails `5.2.8.1`
- and uses `PostgreSQL`

## Local Setup

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle install`
    * `rails db:{create,migrate,seed}`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.


## Database Schema

<div align="center">
  ![image](app/assets/Tea_club_schema.png)
</div>

## All Available End Points:

### Subscription End Points

#### Subscription Create


Creates Subscriptions

`POST  /api/v1/subscriptions`

or

`POST http://localhost:3000/api/v1/subscriptions`



<b>Example Input:</b>

```json
{
    "api_key": "fe7d99c80e8b5b56c784",
    "country": "Thailand",
    "recipe_link": "https://www.nam.com",
    "recipe_title": "Koi Soy"
}
```
<b>Example Output:</b>
```json
{
    "success": {
        "message": "Favorite added successfully"
    }
}
```
#### Favorites Index


`GET /api/v1/favorites`

or

`GET http://localhost:3000/api/v1/favorites{api_key}`

<b>Example Input:</b>

`GET http://localhost:3000/api/v1/favorites?api_key=fe7d99c80e8b5b56c784`

<b>Example Output:</b>
```json
{
    "data": [
        {
            "id": "34",
            "type": "favorite",
            "attributes": {
                "recipe_title": "Koi Soy",
                "recipe_link": "https://www.nam.com",
                "country": "Thailand",
                "created_at": "2022-11-16T02:21:00.125Z"
            }
        },
        {
            "id": "35",
            "type": "favorite",
            "attributes": {
                "recipe_title": "Bun Cha",
                "recipe_link": "https://www.nam.com",
                "country": "Vietnam",
                "created_at": "2022-11-16T02:24:25.455Z"
            }
        }
    ]
}
```
##


## Contributors


<img src="https://avatars.githubusercontent.com/u/106836658?s=120&v=4" />

Erik Riggs | [Github](https://github.com/eriggs0207) | [LinkedIn](https://www.linkedin.com/in/erik-riggs/) |

##

[Back To Top](#back-end-repository-for-lunch-and-learn)
