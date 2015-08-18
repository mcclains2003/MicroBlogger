require_relative 'micro_blogger'

describe MicroBlogger do 

  before do
    @spec = MicroBlogger.new
    message = "".ljust(140, "abcd")
    message_lg = "".ljust(141, "abcd")
  end

  it "tweets a message if less than or equal to 140 characters" do
    @spec.tweet(message).should == "abcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcd"
  end

  it "returns message that you are over 140 characters" do
    @spec.tweet(message_lg).should == "Sorry, this post is larger than 140 characters and will not be posted."
  end

  it "allows user input" do 
    @spec.run.should == "bob"
  end

  it "allows you to send a directed message" do 
    @spec.dm(target, message).should == "bob"
  end

  it "creates an array of followers" do
    @spec.followers_list.array?.should == true
  end

  it "creates a spam blast to followers" do 
    @spec.spam_my_followers(message).should == "bob"
  end

end