require 'spec_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

def go_homepage
  visit('/')
end

def go_homepage_fill_in_send(msg = "Short Message")
  go_homepage
  fill_in('message', with: msg)
  click_button('🤙')
end

def go_homepage_fill_in_tag_send(num = 1, msg = "Short Message", tag = "shrttag")
  num.times {
    go_homepage
    fill_in('message', with: msg)
    fill_in('tag', with: tag)
    click_button('🤙')
  }
end

def go_homepage_fill_in_send_2_messages
  go_homepage_fill_in_send
  go_homepage_fill_in_send("another message")
  click_button('🤙')
end

def go_homepage_fill_in_long_message
  go_homepage_fill_in_send("this is my message i am posting")
  click_button('🤙')
end

def wipe_db
  DatabaseCleaner.clean
end
