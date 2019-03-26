require_relative './webhelpers'

describe 'tag features' do

  after(:example) do
    wipe_db
  end

  # as a user
  # so i can post messages with a tag
  # i want a text box for both and a send button

  feature 'text box' do
    scenario 'post message with tag and have tag appear' do
      go_homepage_fill_in_tag_send
      expect(page).to have_content 'Short Message'
      expect(page).to have_content 'shrttag'
    end
  end

  # as a user
  # so that I can read the full message
  # I want to be able to click on a preview and
  # read only the full message I clicked.

  feature 'seeing messages with same tag at new address' do
    scenario 'click on message tag to see tagged messages' do
      go_homepage_fill_in_tag_send(5)
      go_homepage_fill_in_tag_send(1, 'message to be viewed and clicked', 'newtag')
      click_on(Message.all[5].tag)
      expect(page).to have_content 'message to be viewed and clicked'
      expect(page).to_not have_content 'Short Message'
    end
  end

  # As a user
  # So I can change a message thats been posted
  # I want to update a message

  feature 'Updating a messages tag' do
    scenario 'A user can update a message' do

      go_homepage_fill_in_tag_send(1, 'ahm sure ill want to update this one day', 'changethis')
      expect(page).to have_content('ahm sure ill want to')

      first("#indv_msg").click_button 'Update'
      expect(current_path).to eq "/#{Message[0].id}/update"

      fill_in('message', with: 'im sure ill want to update this one day')
      fill_in('tag', with: 'changedthis')
      click_button('🤙')

      expect(current_path).to eq '/'
      expect(page).not_to have_content('ahm sure ill want to')
      expect(page).to have_content('im sure ill want to')
      expect(page).not_to have_content('changethis')
      expect(page).to have_content('changedthis')

    end
  end
end
