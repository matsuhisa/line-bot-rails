class Question
  attr_accessor :params

  def initialize(params)
    @params = Hash[URI::decode_www_form(params)]
  end

  def message
    case params['next_action']
    when "numbers"
      format numbers
    when "costs"
      null
    else
      null
    end
  end

  def format(response)
    {
      "type": "template",
      "altText": "this is a carousel template",
      "template": {
          "type": "carousel",
          "columns": response
      }
    }
  end

  def numbers
    [
      {
        "thumbnailImageUrl": "https://farm5.staticflickr.com/4244/35370997765_5f65dd60da_k_d.jpg",
        "title": "80人ぐらいで",
        "text": "家族や職場の人も。賑やかに40〜80人",
        "actions": [
          {
            type: "postback",
            label: "80人ぐらい",
            data: "next_action=cost&numbers=80"
          },
          {
            type: "uri",
            label: "詳細",
            uri: "https://www.flickr.com/photos/matsuhisa/35241101511"
          }
        ]
      },
      {
        "thumbnailImageUrl": "https://farm5.staticflickr.com/4288/35241101511_d919ed5d75_k_d.jpg",
        "title": "家族と親類で",
        "text": "家族で和やかに、10〜20人プラン",
        "actions": [
          {
            type: "postback",
            label: "20人ぐらい",
            data: "next_action=cost&numbers=20"
          },
          {
            type: "uri",
            label: "詳細",
            uri: "https://www.flickr.com/photos/matsuhisa/35241101511"
          }
        ]
      }
    ]
  end

end
