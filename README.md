# Lean Coffee

Lean Coffee is a structured, but agenda-less meeting. Participants gather, build an agenda,
and begin talking. Conversations are directed and productive because the agenda for the
meeting was democratically generated.

Agile Weekly has a [nice video](https://www.youtube.com/watch?v=zhG-A-kRPAU) on how to run a
Lean Coffee.

This application is for running one for distributed teams. It's pretty cool.

## Demonstration

![Demo](https://raw.githubusercontent.com/jgorset/lean-coffee/master/doc/animated.gif)

## Dependencies

You'll need [Ruby 2.1](https://www.ruby-lang.org/en/) with [Bundler](http://bundler.io/) and
[PostgreSQL](http://www.postgresql.org/) to run Lean Coffee.

## Installation

Clone the repository:

`$ git clone git@github.com:jgorset/lean-coffee.git`

Install the gems:

`$ bundle install`

Create a PostgreSQL database:

`$ psql -d template1 -c "CREATE DATABASE lean-coffee-production"`

Initialize the database:

`$ rake db:setup`

Run the server:

`$ rails server`

## Contribute

* Fork [the repository](http://github.com/jgorset/lean-coffee).
* Do your thing (preferably on a feature branch).
* Write a test that demonstrates that the bug was fixed or the feature works as expected.
* Send a pull request and bug me until I merge it!

## I love you

Johannes Gorset made this. You should [tweet me](http://twitter.com/jgorset) if you can't get it
to work. In fact, you should tweet me anyway.

## I love Hyper

I work at Hyper with a bunch of awesome folks who are all every bit as passionate about good code
as myself. If you're using this library, we probably want to hire you.
