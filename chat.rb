require 'json'
require 'bunny'
# Console chat client
class Chat

  # formats display of messages
  def display_message(user, message)
    puts "#{user}: #{message}"
  end

  def initialize
    print 'Type in your name: '
    # gets user name from console
    @current_user = gets.strip
    puts "Hi #{@current_user}, you just joined a chat room!" \
         ' Type your message in and press enter.'

    # initialize bunny with default local machine
    conn = Bunny.new
    # connect to RabbitMQ server
    conn.start

    # create channel - key of communication
    @channel = conn.create_channel
    # set exchange rule to instrested in super.chat
    @exchange = @channel.fanout('super.chat')

    listen_for_messages
  end

  def listen_for_messages
    # set random, uniq queue name for storing messages
    queue = @channel.queue('')

    # subscribe queue to fanout exchange, parse JSON message
    # and print it in console
    queue.bind(@exchange).subscribe do |_delivery_info, _metadata, payload|
      data = JSON.parse(payload)
      display_message(data['user'], data['message'])
    end
  end

  def publish_message(user, message)
    data = { user: user, message: message }
    # publish prepared data to server, message will be delivered to
    # channels with apriopriate fanout exchange
    @exchange.publish(data.to_json)
  end

  # infinite loop for get input from console and publish it to others
  def wait_for_message
    loop do
      message = gets.strip
      publish_message(@current_user, message)
    end
  end
end

# class initialize
chat = Chat.new
# start reading input from console
chat.wait_for_message
