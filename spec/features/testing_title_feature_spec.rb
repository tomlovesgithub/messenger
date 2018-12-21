require_relative './webhelpers'

# as a user
# so i know that i am on the right page,
# i wasnt to see a heading thats says '🤙'

feature 'Heading' do
  scenario 'heading displays "🤙" title' do
    go_homepage
    expect(page).to have_content '🤙'
  end
end

# as a user
# so i can post messages
# i want a text box with send button and then have them appear on the page

feature 'text box' do
  scenario 'post message and have it appear' do
    go_homepage_fill_in_and_send
    expect(page).to have_content 'Short Message'
  end
end

# as a user
# so i can see past messages
# i want my page to display the history of messages

feature 'message history' do
  scenario 'post message and have it appear' do
    go_homepage_fill_in_and_send_2_messages
    expect(page).to have_content 'Short Message'
    expect(page).to have_content 'another message'
  end
end

feature 'message history' do
  # order test
end

# as a user
# so that i can only see the frist twenty characters of a message
# i want the message to be cropped at 20 characters

feature 'message preview' do
  scenario 'post message longer than 20 characters and only first 20 appear' do
    go_homepage_fill_in_long_message
    expect(page).to_not have_content ' am posting'
  end

  # as a user
  # so that I can read the full message
  # I want to be able to click on a preview and
  # read only the full message I clicked.

  feature 'seeing full message at new address' do
    scenario 'click on message preview to read full message' do
      go_homepage_fill_in_and_send_2_messages
      go_homepage_fill_in_and_send('message to be viewed and clicked')
      click_button('send')
      # binding.pry
      click_link(Message.all[9].preview)
      expect(page).to have_content 'message to be viewed and clicked'
      expect(page).to_not have_content 'Short Message'
    end
  end
end
