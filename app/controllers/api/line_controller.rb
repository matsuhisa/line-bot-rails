class Api::LineController < ApplicationController
  protect_from_forgery except: :callback
  require 'line/bot'

  def callback
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      head :bad_request
      # status: 400
      # error 400 do 'Bad Request' end
    end

    events = client.parse_events_from(body)
    events.each { |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          # message = {
          #   type: 'text',
          #   text: event.message['text']
          # }

          message = {
            "type": "template",
            "altText": "this is a carousel template",
            "template": {
                "type": "carousel",
                "columns": [
                    {
                      "thumbnailImageUrl": "https://farm5.staticflickr.com/4244/35370997765_5f65dd60da_k_d.jpg",
                      "title": "this is menu",
                      "text": "description",
                      "actions": [
                        {
                          type: "postback",
                          label: "Buy",
                          data: "action=buy&itemid=123"
                        },
                        {
                          type: "uri",
                          label: "電話する",
                          uri: "tel:09012345678"
                        },
                        {
                          type: "uri",
                          label: "詳細",
                          uri: "https://www.flickr.com/photos/matsuhisa/35370997765"
                        }
                      ]
                    },
                    {
                      "thumbnailImageUrl": "https://farm5.staticflickr.com/4288/35241101511_d919ed5d75_k_d.jpg",
                      "title": "this is menu",
                      "text": "description",
                      "actions": [
                        {
                          type: "postback",
                          label: "Buy",
                          data: "action=buy&itemid=123"
                        },
                        {
                          type: "uri",
                          label: "電話する",
                          uri: "tel:09012345678"
                        },
                        {
                          type: "uri",
                          label: "詳細",
                          uri: "https://www.flickr.com/photos/matsuhisa/35241101511"
                        }
                      ]
                    }
                ]
            }
          }

          response = client.reply_message(event['replyToken'], message)
          p response
        end
      end
    }
    head :ok
  end

  private

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end
end
