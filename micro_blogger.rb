require 'jumpstart_auth'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing MicroBlogger..."
    @client = JumpstartAuth.twitter
  end

  def dm(target, message)
    puts "Trying to send #{target} this direct message:"
    puts message
  end

  def run
    puts "Welcome to the JSL Twitter Client!"
    command = ""
    while command != "q"
      printf "enter command: "
      input = gets.chomp
      parts = input.split(" ")
      command = parts[0]
      case command
        when 'dm' then dm(parts[1], parts[2..-1].join(" "))
        when 'q' then puts "Goodbye!"
        when 't' then tweet(parts[1..-1].join(" "))
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

