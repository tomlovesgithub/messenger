require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

def go_homepage
  visit('/')
end

def go_homepage_fill_in_and_send(message = "Short Message")
  go_homepage
  fill_in('message', with: message)
  click_button('🤙')
end

def go_homepage_fill_in_and_send_2_messages
  go_homepage_fill_in_and_send
  go_homepage_fill_in_and_send("another message")
  click_button('🤙')
end

def go_homepage_fill_in_long_message
  go_homepage_fill_in_and_send("this is my message i am posting")
  click_button('🤙')
end

def wipe_db
  DatabaseCleaner.clean
end
