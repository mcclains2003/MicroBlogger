require_relative 'micro_blogger'

describe MicroBlogger do 

  before do
    @spec = MicroBlogger.new
    message = 
    message_lg = 
  end

  it "tweets a message if less than or equal to 140 characters" do
    @spec.tweet(message) ==
  end

  it "returns message that you are over 140 characters" do
    @spec.tweet(message_lg) == 
  end

end