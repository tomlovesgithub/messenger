#🤙

## Description
An refreshingly simplistic take on online messaging.
 🤙 allows users to:
  *Enter messages and submit
  *Display messages in reverse chronological order
  *Display timestamp alongside message
  *Previews only the first 20 characters of each message on the homepage
  *Edit posted messages (NOT YET IMPLEMENTED)
  *Delete posted messages (NOT YET IMPLEMENTED)

## Build Status

Working, not finished

## Installation

To install 🤙:

```
$ git clone https://github.com/tomlovesgithub/message
$ cd message
$ bundle install
$ rackup
```

To load the database:

*Connect to psql
*Create the database using the psql command CREATE DATABASE message_app;
*Connect to the database using the pqsl command \c message_app;
*Run the query we have saved in the file 01_create_messages_table.sql

Then head to the assigned port (default: 9292) to start sending messages!

## User instructions

Type your message into the 'Enter you message' field and hit submit. It will appear along with the timestamp on that same page!
