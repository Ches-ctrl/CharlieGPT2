# chat_with_gpt.rb

require 'openai'

# Configure the gem with your OpenAI API key
OpenAI.configure do |config|
  config.access_token = OPENAI_ACCESS_TOKEN
end

# Function to initiate a chat with ChatGPT
def chat_with_gpt(prompt)
  response = OpenAI.chat(
    parameters: {
      model: 'gpt-3.5-turbo', # Choose the desired model
      messages: [{ role: 'user', content: prompt }],
      temperature: 0.7,
    }
  )

  # Output the assistant's response
  puts response.dig('choices', 0, 'message', 'content')
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
