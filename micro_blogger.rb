require 'jumpstart_auth'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing MicroBlogger..."
    @client = JumpstartAuth.twitter
  end

  def run
    puts "Welcome to the JSL Twitter Client!"
    command = ""
    while command != "q"
      printf "enter command: "
      input = gets.chomp
      case command
        when 'q' then puts "Goodbye!"
        when 't' then tweet(command)
        else
          puts "Sorry, I don't know how to #{command}"
      end 
    end
  end

  def tweet(message)
    if message.size <= 140
      @client.update(message)
    else
      puts "Sorry, this post is larger than 140 characters and will not be posted."
    end
  end

  blogger = MicroBlogger.new
  blogger.run

end

