require_relative 'micro_blogger'

describe MicroBlogger do 

  before do
    @spec = MicroBlogger.new
    message = 
    message_lg = 
  end

  it "tweets a message if less than or equal to 140 characters" do
    @spec.tweet(message).should ==
  end

  it "returns message that you are over 140 characters" do
    @spec.tweet(message_lg).should == 
  end

  it "allows user input" do 
    @spec.run.should == 
  end

  it "allows you to send a directed message" do 
    @spec.dm(target, message).should ==
  end

end