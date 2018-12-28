require './lib/message.rb'
require_relative '../features/webhelpers'

describe Message do
  input = "this string is more than 20 characters"
  let(:time_double) { DateTime.now.strftime("%d/%m/%Y - %H:%M:%S.%P") }
  let(:message) { described_class.create(:content => input) }

  it 'stores given message as content' do
    expect(message.content).to eq("this string is more than 20 characters")
    wipe_db
  end

  it 'has time' do
    time_double.freeze
    expect(message).to have_attributes(:display_time => time_double)
    wipe_db
  end

  it 'only displays first 20 characters' do
    expect(message.preview.length).to eq(20)
    wipe_db
  end

  it 'deletes the given message' do
    Message.delete(id: message.id)
    expect(Message.all.length).to eq 0
  end

end
