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

  def dm(target, message)
    screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
    if screen_names.include?(target)
      puts "Trying to send #{target} this direct message:"
      puts message
      message = "d @#{target} #{message}"
      tweet(message)
    else
      puts "You can only DM people who follow you!"
    end
  end

  def followers_list
    screen_names = []
    @client.followers.each do |follower|
      screen_names << @client.user(follower).screen_name
    end
    return screen_names
  end

  def spam_my_followers(message)
    followers_list.each do |target|
      dm(target, message)
    end
  end

  blogger = MicroBlogger.new
  blogger.run

end

