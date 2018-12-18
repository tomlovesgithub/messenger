class Message

  attr_reader :content, :time

  def initialize(content)
    @content = content
    @time = Time.now.strftime("%d/%m/%Y %H:%M:%S:%L.%P")

  end

end
