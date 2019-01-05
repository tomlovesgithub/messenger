require 'data_mapper'
require "pg"

class Message

  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :content,    Text      # A text block, for longer string data.
  property :created_at, DateTime  # A DateTime, for any date you might like.
  property :tag, String, :required => false # A string, for tag data, can be left blank

  def preview
    content[0..19]
  end

  def display_time
    created_at.strftime("%d/%m/%Y - %H:%M:%S.%P")
  end

  def self.delete(id:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'message_app_test')
    elsif ENV['RACK_ENV'] == 'development'
      connection = PG.connect(dbname: 'message_app_development')
    end
    connection.exec("DELETE FROM messages WHERE id = #{id}")
  end

end
