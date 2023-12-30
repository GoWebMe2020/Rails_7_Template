# Rails Template Backend

## Description

This is a template to demonstrate how to setup a Rails backend with a ReactJS frontend. The intention is to allow users to fork this repo, along with the ReactJS template, configure it and use it to their liking.

## Technologies & References

* Rails 7 (https://guides.rubyonrails.org/7_0_release_notes.html)
* Postgres (https://www.postgresql.org | )
* Dotenv (https://github.com/bkeepers/dotenv)

## Setup

1. Ensure that you have the necessary technologies for this application. Refer to the list Technologies & References and visit the relevant websites to learn how to install them.

2. To Create New Rails Project:

  ```bash
    $ rails new myapp --api -d postgresql
  ```
This creates a new Rails API app with PostgreSQL as the database.

3. Configure Database:

  * Adding the role to postgres for the app
  ```bash
    $ psql
    > CREATE ROLE <app_name> WITH SUPERUSER LOGIN PASSWORD '<password>';
    # If this action was successful you will get the below message.
    CREATE ROLE
    > exit
  ```
  * Edit `config/database.yml` to set up your PostgreSQL credentials using Dotenv.
    - Create a `.env` file in your root directory and insert you database username and password. Ensure that this file is listed in your gitignore file and never commit and submit this file to Github.
  ```ruby
    default: &default
      adapter: postgresql
      encoding: unicode
      pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
      username: <%= ENV["TEMPLATE_RAILS_BACKEND_DATABASE_USERNAME"] %>
      password: <%= ENV["TEMPLATE_RAILS_BACKEND_DATABASE_PASSWORD"] %>

    development:
      <<: *default
      database: appname_development
  ```
  * Create your database.
  ```bash
    $ rails db:setup
    # or
    $ rails db:create
  ```

# Other

https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-macos
