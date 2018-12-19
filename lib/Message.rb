class Message

  attr_reader :content, :time

  def initialize(content)
    @content = content
    @time = Time.now
  end

  def preview
    @content[0..19]
  end

  def display_time
    @time.strftime("%d/%m/%Y %H:%M:%S:%L.%P")
  end

end
