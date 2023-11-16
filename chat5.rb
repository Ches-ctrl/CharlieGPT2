# chat_with_gpt.rb

require 'openai'

# Configure the gem with your OpenAI API key
OpenAI.configure do |config|
  config.access_token = 'OPENAI_ACCESS_TOKEN'
end

# Function to initiate a chat with ChatGPT
def chat_with_gpt(prompt)
  client = OpenAI::Client.new # Create a new client instance

  loading_thread = Thread.new do
    while true
      animate_dots(100, 0.5)
    end
  end

  response = client.chat(
    parameters: {
      model: 'gpt-3.5-turbo', # Choose the desired model
      messages: [{ role: 'user', content: prompt }],
      temperature: 0.7,
    }
  )

  # Stop the loading indicator thread
  loading_thread.kill

  puts ' Done!'

  # Output the assistant's response
  puts response.dig('choices', 0, 'message', 'content')
end

def animate_dots(iterations, delay)
  (1..iterations).each do |i|
    dots = '.' * i
    print "\r#{dots}\r"
    sleep delay
  end
end

# Get user input and start the chat
puts 'Enter your message (type "exit" to end the conversation):'
user_input = gets.chomp

while user_input.downcase != 'exit'
  chat_with_gpt(user_input)

  puts 'Enter your next message (type "exit" to end the conversation):'
  user_input = gets.chomp
end

puts 'Conversation ended. Goodbye!'
