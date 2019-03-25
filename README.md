#🤙

## Description
An refreshingly simplistic take on online messaging.
 🤙 allows users to:
  *Enter messages and submit
  *Display messages in reverse chronological order
  *Display timestamp alongside message
  *Previews only the first 20 characters of each message on the homepage
  *Edit posted messages
  *Delete posted messages

## Installation

To install 🤙:

```
$ git clone https://github.com/tomlovesgithub/message
$ cd message
$ brew install postgres
$ bundle install
$ createdb message_app_development
$ rackup
```

To run the test suite:
$ createdb message_app_test
$ rake spec

## User instructions

Type your message into the 'Enter you message' field and hit submit. It will appear along with the timestamp on that same page!
