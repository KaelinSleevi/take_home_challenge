<a name="readme-top"></a>

<br />
<div align="center">

<h1 align="center"><strong>Tea Subscription</strong></h1>

  <p align="center">
    <h2> This assignment was a take-home challenge. Within 6 to 8 hours we were tasked to create an API with three tables and endpoints described to us. In this project, there are Customers, Subscriptions, and Teas. With the three endpoint being to create a subscription, cancel a subcription, and return the customers subscriptions for a tea service.</h2>
    <br />
    <a href="https://github.com/KaelinSleevi/take_home_challenge"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    ·
    <a href="https://github.com/KaelinSleevi/take_home_challenge/issues">Report Bug</a>
    ·
    <a href="https://github.com/KaelinSleevi/take_home_challenge/issues">Request Feature</a>
  </p>
</div>
<br>

# About The Project
<details>
  <h1><summary>Table of Contents</summary></h1>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
        <li><a href="#built-with">Built With</a></li>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
    </li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#apis">APIs</a></li>
    <li><a href="#contacts">Contacts</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>
 

### Built With
<div align="center">


![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![Ruby on Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Miro](https://img.shields.io/badge/Miro-050038?style=for-the-badge&logo=Miro&logoColor=white)
![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white)

</div>


### Getting Started
<br />

#### Prerequistites

The Tea Subscription backend is build on Rails 5.2.8.1 and Ruby 2.7.4


#### Installation and setup
1. Fork and clone the repo

1. Add gems
   In the main body:
   ```sh
   gem 'jsonapi-serializer'
   ```
   In group :development, :test do

   ```sh
   gem 'factory_bot_rails'
   gem 'faker'
   gem 'pry'
   gem 'rspec-rails'
   gem 'shoulda-matchers'
   gem 'simplecov'
   ```

1. Install Gems with `$bundle install`

1. Migrate database with `$rails db:{create,migrate}`

1. Seed development/test database with `$rails db:seed`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

--------

 #### Database Schema

<div align="center">
  <img width="441" alt="Screen Shot 2023 01 09 at 7 00 06 PM" src="https://user-images.githubusercontent.com/105956031/212371706-2865aacd-dff7-46b5-a614-adecd4d3e0d1.png">
</div>


<p align="right">(<a href="#readme-top">back to top</a>)</p>

---------



## Endpoints

* Get a Customers Subscriptions

  ```
  {
    "data": {
        "id": 1,
        "type": "customer",
        "attributes": {
            "first_name": "Ally",
            "last_name": "Mo",
            "email": "moballyally@guhmail.com",
            "address": "601 Lakeshore Drive",
            "subscriptions": [
                {
                    "title": "Lavender Dreams",
                    "price": 3.99,
                    "status": "cancelled",
                    "frequency": "montly"
                }
            ]
        }
    }
  }
  ```

* CREATE a Subscription

  ```
  {
    "data": {
        "id": "3",
        "type": "subscription",
        "attributes": {
            "title": "Lavender Dreams",
            "status": "active",
            "price": 3.99,
            "frequency": "montly"
        }
    }
  }
  ```

* Cancel a Subscription(Patch)

  ```
  {
    "data": {
        "id": "3",
        "type": "subscription",
        "attributes": {
            "title": "Lavender Dreams",
            "status": "cancelled",
            "price": 3.99,
            "frequency": "montly"
        }
    }
  }
  ```



---------

<div align="center">

#### Gem Documentation

<table>
  <tr>
    <td align="center"><a href="https://github.com/thoughtbot/factory_bot_rails">factory_bot_rails</a></td>
    <td align="center"><a href="https://github.com/faker-ruby/faker">faker</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/jsonapi-serializer/jsonapi-serializer">jsonapi-serializer</a></td>
    <td align="center"><a href="https://github.com/pry/pry">pry</a></td>
    <td align="center"><a href="https://github.com/rspec/rspec-rails">rspec-rails</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/thoughtbot/shoulda-matchers">shoulda-matchers</a></td>
    <td align="center"><a href="https://github.com/simplecov-ruby/simplecov">simplecov</a></td>
  </tr>
</table>


</div>
