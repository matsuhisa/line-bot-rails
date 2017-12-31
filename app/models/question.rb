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
    columns = [
      {
        "thumbnailImageUrl": "http://2.bp.blogspot.com/-UtyHZTr8itg/VYJru5mxDMI/AAAAAAAAukE/6iB071EEzdA/s800/party_formal_rissyoku.png",
        "title": "80人ぐらいで",
        "text": "家族や職場の人も。賑やかに40〜80人",
        "actions": [
          {
            type: "postback",
            label: "80人ぐらい",
            data: "next_action=cost&numbers=80"
          }
        ]
      },
      {
        "thumbnailImageUrl": "http://1.bp.blogspot.com/-E8IWSr1cQWA/U2ssTECWv4I/AAAAAAAAgDU/4v_RdErMLr0/s800/wedding_oya.png",
        "title": "家族と親類で",
        "text": "家族で和やかに、10〜20人プラン",
        "actions": [
          {
            type: "postback",
            label: "20人ぐらい",
            data: "next_action=cost&numbers=20"
          }
        ]
      }
    ]
  end

end
