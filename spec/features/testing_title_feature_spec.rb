# as a user
# so i know that i am on the right page,
# i wasnt to see a heading thats says '🤙'

feature 'Heading' do
  scenario 'heading displays "🤙" title' do
    visit('/')
    expect(page).to have_content '🤙'
  end
end

# as a user
# so i can post messages
# i want a text box with send button

feature 'text box' do
  scenario 'post message and have it appear' do
    visit('/')
    fill_in('message', with: 'My Message')
    click_button('send')
  end
end

# as a user
# so i can post messages
# i want a text box with send button and then have them appear on the page

feature 'text box' do
  scenario 'post message and have it appear' do
    visit('/')
    fill_in('message', with: 'My Message')
    click_button('send')
    expect(page).to have_content 'My Message'
  end
end

# as a user
# so i can see past messages
# i want my page to display the history of messages

feature 'message history' do
  scenario 'post message and have it appear' do
    visit('/')
    fill_in('message', with: 'My Message')
    click_button('send')
    expect(page).to have_content 'My Message'
    fill_in('message', with: 'another message')
    click_button('send')
    expect(page).to have_content 'My Message'
    expect(page).to have_content 'another message'
  end
end

feature 'message history' do
  #order test
end

# as a user
# so that i can only see the frist twenty characters of a message
# i want the message to be cropped at 20 characters

feature 'message preview' do
  scenario 'post message longer than 20 characters and only first 20 appear' do
    visit('/')
    fill_in('message', with: 'this is my message i am posting')
    click_button('send')
    expect(page).to_not have_content ' am posting'
  end

# as a user
# so that I can read the full message
# I want to be able to click on a preview and read only the full message I clicked.

  # feature 'seeing full message at new address' do
  #   scenario 'click on message preview to read full message' do
  #     visit('/')
  #     fill_in('message', with: 'this is my message i am posting')
  #     click_button('send')
  #     fill_in('message', with: 'Here is a new message, which is over 20 characters')
  #     click_button('send')
  #     click_link('id')
  #     expect(page).to have_content 'Here is a new message, which is over 20 characters'
  #     expect(page).to_not have_content 'this is my message i am posting'
  #   end
  # end
end
