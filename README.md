# MyNotes

A web application for writing down your thoughts!

Yeah, it's *scientifically proven* that writing down your thoughts leads to mental and physical improvements! Do it! :-)

My first Rails web application, to tinker with:

* the Rails architecture, obv.
* minitest
* faker
* kaminari
* font-awesome-rails
* smacss + scss + bem
* haml
* some jquery for displaying flash messages
* deployment on digital ocean
* nginx configuration

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
