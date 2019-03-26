# 🤙
A refreshingly simplistic take on online messaging.

## Features
 _🤙_ allows users to:
 - Enter messages and submit
  - Display messages in reverse chronological order
  - Display timestamp alongside message
  - Previews only the first 20 characters of each message on the homepage
  - Edit posted messages and tags
  - Delete posted messages
  - Add Tags to your messages and view other messages with the same tag

## Installation

To install 🤙:

```
- Open your terminal
- enter:
$ git clone https://github.com/tomlovesgithub/message
$ cd message
$ gem install bundler (if you don't have it)
$ brew install postgres (if you don't have it)
$ bundle install
$ createdb _user_
$ createdb message_app_development
$ rackup
```

```
To run the test suite:
$ createdb message_app_test
$ rake spec
```

## User instructions

Type your message into the 'Enter you message' field, add a tag if you fancy and hit submit.
It will appear along with the timestamp on that same page!
Click on the message to view it at a separate URL

## Built With

* Sinatra [web framework for Ruby]
* PostgresSQL and Datamapper for databasing
* Rspec, Capybara and Rubocop for testing and linting
* Rake for Database commands

##

This project was built as part of my course at Makers Academy 
