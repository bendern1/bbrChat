require 'openai_chatgpt'
require "telegram/bot"

client = OpenaiChatgpt::Client.new(api_key: ENV['CHATGPT_API_KEY'])

Telegram::Bot::Client.run(ENV['TELEGRAM_API_TOKEN']) do |bot|
  bot.listen do |message|
    if message.text
      response = client.completions(model: "gpt-3.5-turbo", messages: [{role: "user", content: message.text}])
      bot.api.send_message(
        chat_id: message.chat.id,
        text: response.results[0].content
      )
    end
  end
end
