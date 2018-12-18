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
    fill_in('message', with: 'this is my message i am posting')
    click_button('send')
  end
end

# as a user
# so i can post messages
# i want a text box with send button and then have them appear on the page

feature 'text box' do
  scenario 'post message and have it appear' do
    visit('/')
    fill_in('message', with: 'this is my message i am posting')
    click_button('send')
    expect(page).to have_content 'this is my message i am posting'
  end
end

# as a user
# so i can see past messages
# i want my page to display the history of messages

feature 'text box' do
  scenario 'post message and have it appear' do
    visit('/')
    fill_in('message', with: 'this is my message i am posting')
    click_button('send')
    expect(page).to have_content 'this is my message i am posting'
    visit('/')
    fill_in('message', with: 'this is another message i am posting')
    click_button('send')
    expect(page).to have_content 'this is my message i am posting'
    expect(page).to have_content 'this is another message i am posting'
  end
end
