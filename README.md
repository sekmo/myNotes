# MyNotes

A web application for writing down your thoughts!

Yeah, it's *scientifically proven* that writing down your thoughts leads to mental and physical improvements! Build a new healthy habit!

My first Rails project, to tinker with:

* the Rails MVC architecture
* rspec, capybara, factory_girl, faker
* scss, haml, smacss & bem conventions
* devise
* kaminari
* some jquery
* nginx configuration and deployment on digital ocean

Demo at [https://mynotes.sekmo.cc](https://mynotes.sekmo.cc)

## Installation

Run:
```shell
bundle
bin/rails db:create db:migrate
bin/rails s
```

App is running at [localhost:3000](http://localhost:3000/).

## Test

Run:
```shell
bundle exec rspec
```
