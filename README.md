# README

* Ruby 3.1.1
* Rails 6.1
* SQLite3
* Redis
* Twitter Bootstrap
* Stimulus
* RSPec (basic specs for most important funcionalities)

## Before run app locally

Ensure that you have Ruby 3.1.1 and Rails 6.1 installed.
App works with SQLite3, Redis and Webpacker through Foreman

Clone repo and run setup:

```
git clone git@github.com:bondarolik/SentenceEntitiesApp.git
cd SentenceEntitiesApp/
bundle install
yarn install
rails db:create && rails db:migrate
rails db:seed
```

## Start application in development

This will start Webpacker Dev Server and Rails server at 5100 port

```ruby
foreman start
```

Open `http://localhost:5100` and you will see Sentences main page. Add new sentences o manage Entities for created ones.

## Would be nice to refactor:

1. Extract `entities.create and update` methods to *Service Layer* 
2. Add flash alerts
3. No `update` method. 
4. Also possible to write more specs for Views using Capybara
5. More complex: use Presenter or Decorator instead of simple Helper
6. More complex app: can use Serializer
