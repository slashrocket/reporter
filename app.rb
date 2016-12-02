require "sinatra"
require "httparty"

get "/" do
  redirect to('https://slashrocket.io')
end

post "/" do
  message_link = params.fetch('text').strip
  token = params.fetch('token').strip

  if token == ENV["TOKEN"]
    if /(https:\/\/slashrocket.slack.com\/archives\/)/.match(message_link)
      report(message_link)
      "Thank you. This message has been anonymously reported to the admin team."
    else
      "Please report a specific Slack message. The easiest way to do this is to right-click the timestamp (or long-press the message on mobile) and copy the link."
    end
  else
    "Sorry, this is unauthorized behavior."
  end
end

def report(message)
    slack_webhook = ENV["WEBHOOK_URL"]
    HTTParty.post slack_webhook, body: {"text" => "A user has reported this message: <#{message}>"}.to_json, headers: {'content-type' => 'application/json'}
end
