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
    go_homepage_fill_in_send
    expect(page).to have_content 'Short Message'
    wipe_db
  end
end

# as a user
# so i can see past messages
# i want my page to display the history of messages

feature 'message history' do
  scenario 'post message and have it appear' do
    go_homepage_fill_in_send_2_messages
    expect(page).to have_content 'Short Message'
    expect(page).to have_content 'another message'
    wipe_db
  end
end

feature 'message history' do
  # order test
end

# as a user
# so that i can only see the frist twenty characters of a message
# i want the message to be cropped at 20 characters

feature 'message preview' do
  scenario 'only first 20 chars of message appear' do
    go_homepage_fill_in_long_message
    expect(page).to_not have_content ' am posting'
    wipe_db
  end
end

# as a user
# so that I can read the full message
# I want to be able to click on a preview and
# read only the full message I clicked.

feature 'seeing full message at new address' do
  scenario 'click on message preview to read full message' do
    go_homepage_fill_in_send_2_messages
    go_homepage_fill_in_send('message to be viewed and clicked')
    click_on(Message.all[3].preview)
    expect(page).to have_content 'message to be viewed and clicked'
    expect(page).to_not have_content 'Short Message'
    wipe_db
  end
end

# As a user
# So I can remove an entry from messenger
# I want to delete a message

feature 'Deleting an entry' do
  scenario 'a user can delete an message' do
    go_homepage_fill_in_send('im sure ill want to delete this one day')
    first("#indv_msg").click_button 'Delete'
    expect(current_path).to eq "/"
    expect(page).not_to have_content('im sure ill want to ')
    wipe_db
  end
end

# As a user
# So I can change a message thats been posted
# I want to update a message

feature 'Updating a message' do
  scenario 'A user can update a message' do

    go_homepage_fill_in_send('ahm sure ill want to update this one day')
    expect(page).to have_content('ahm sure ill want to')

    first("#indv_msg").click_button 'Update'
    expect(current_path).to eq "/#{Message[0].id}/update"

    fill_in('message', with: 'im sure ill want to update this one day')
    click_button('🤙')

    expect(current_path).to eq '/'
    expect(page).not_to have_content('ahm sure ill want to')
    expect(page).to have_content('im sure ill want to')
    wipe_db
  end
end
