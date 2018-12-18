# as a user
# so i know that i am on the right page,
# i wasnt to see a heading thats says 'MyFace Messenger'

feature 'Heading' do
  scenario 'heading displays "chat-Ed" title' do
    visit('/')
    expect(page).to have_content 'chat-ED'
  end
end
