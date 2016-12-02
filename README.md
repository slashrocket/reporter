# Reporter

A slash command for reporting Slack messages to the admins

## Installation

* Deploy to Heroku, Dokku, or whatever you prefer.
* Set these environment variables:
  * TOKEN: Set up a new [Slash Command](https://api.slack.com/slash-commands) and use the Token.
  * WEBHOOK_URL: Set up a new [Incoming Webhook](https://my.slack.com/services/new/incoming-webhook/) and use the Webhook URL.
* In your newly-created Slash Command, make sure URL is set to `https://your-deployment-url/report` and the Method is set to `POST`.
* You're done!
