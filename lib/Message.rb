require 'data_mapper'

class Message

  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :content,    Text      # A text block, for longer string data.
  property :created_at, DateTime  # A DateTime, for any date you might like.

  def preview
    content[0..19]
  end

  def display_time
    created_at.strftime("%d/%m/%Y - %H:%M:%S.%P")
  end

end
