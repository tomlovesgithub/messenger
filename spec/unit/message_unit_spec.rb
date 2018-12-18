
require './lib/message.rb'

describe Message do

  let(:message) {Message}
  let(:time_double) { Time.now.strftime("%d/%m/%Y %H:%M:%S:%L.%P") }

  it 'stores given message as content' do
    first_message = message.new("content")
    expect(first_message).to have_attributes(:content => "content")
  end

  it 'has time' do
    first_message = message.new("content")
    expect(first_message).to have_attributes(:time => time_double)
  end

end
