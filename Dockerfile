FROM ruby:3.2.2-slim

RUN gem install telegram-bot-ruby openai_chatgpt

COPY . .

EXPOSE 80/tcp

CMD [ "ruby", "bbrChat_bot.rb" ]
