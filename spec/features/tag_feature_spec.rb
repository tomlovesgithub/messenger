require_relative './webhelpers'

# as a user
# so i can post messages with a tag
# i want a text box for both and a send button

feature 'text box' do
  scenario 'post message with tag and have tag appear' do
    go_homepage_fill_in_tag_send
    expect(page).to have_content 'Short Message'
    expect(page).to have_content 'shrttag'
    wipe_db
  end
end

# as a user
# so that I can read the full message
# I want to be able to click on a preview and
# read only the full message I clicked.

feature 'seeing messages with same tag at new address' do
  scenario 'click on message tag to see tagged messages' do
    go_homepage_fill_in_tag_send(5)
    go_homepage_fill_in_tag_send('message to be viewed and clicked', 'tag')
    click_on(Message.all[4].tag)
    expect(page).to have_content 'message to be viewed and clicked'
    expect(page).to_not have_content 'Short Message'
    wipe_db
  end
end

# As a user
# So I can change a message thats been posted
# I want to update a message

feature 'Updating a messages tag' do
  scenario 'A user can update a message' do

    go_homepage_fill_in_tag_send('ahm sure ill want to update this one day', 'changethis')
    expect(page).to have_content('ahm sure ill want to')

    first("#indv_msg").click_button 'Update'
    expect(current_path).to eq "/#{Message[2].id}/update"

    fill_in('message', with: 'im sure ill want to update this one day')
    fill_in('tag', with: 'changedthis')
    click_button('🤙')

    expect(current_path).to eq '/'
    expect(page).not_to have_content('ahm sure ill want to')
    expect(page).to have_content('im sure ill want to')
    expect(page).not_to have_content('changethis')
    expect(page).to have_content('changedthis')

    wipe_db
  end
end
