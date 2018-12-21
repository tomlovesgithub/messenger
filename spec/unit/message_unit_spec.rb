require './lib/message.rb'

describe Message do
  input = "this string is more than 20 characters"
  let(:time_double) { DateTime.now.strftime("%d/%m/%Y %H:%M:%S:%L.%P") }
  subject(:message) { described_class.create(:content => input) }

  it 'stores given message as content' do
    expect(message.content).to eq("this string is more than 20 characters")
  end

  it 'has time' do
    time_double.freeze
    expect(message).to have_attributes(:display_time => time_double)
  end

  it 'only displays first 20 characters' do
    expect(message.preview.length).to eq(20)
  end

end
