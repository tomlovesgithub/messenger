# as a user
# so i can post messages
# i wasnt to see a heading thats says 'MyFace Messenger'

feature 'text box' do
  scenario 'post message and have it appear' do
    visit('/')
    fill_in('message', with: 'this is my message i am posting')
    click_button('send')
    expect(page).to have_content 'this is my message i am posting'
  end
end
