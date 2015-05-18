# Chcklst

チェックリストを生成するだけのWebアプリケーション

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/bugcloud/chcklst/tree/master)

## How to deploy to Heroku

After pushing Heroku button and deploying to Heroku, set application URL manually.

```
heroku config:set APP_BASE_URL='YOUR_HEROKU_APP_URL'
```

## Client

Any client will work.

Hubot script sample is [here](https://gist.github.com/bugcloud/6f788316658a63328f63).

```coffee
# Description:
#   Generate a simple checklist.
#
# Commands:
#   hubot checklist <title> <item1,item2,...> - リストタイトルとアイテムを指定してチェックリストを生成
#

chcklst = 'https://chcklst.herokuapp.com'

module.exports = (robot) ->

  robot.respond /(checklist|chcklst|チェックリスト) (.*) (.*)/i, (msg) ->
    title = msg.match[2]
    items = msg.match[3].split(',').map (item) ->
      item.trim()
    data = JSON.stringify({
      title: title
      items: items.join(',')
    })
    robot.http("#{chcklst}/api/lists.json")
      .headers('Accept': 'application/json', 'Content-Type': 'application/json')
      .post(data) (err, res, body) ->
        unless res.statusCode is 200
          msg.send "A list have not generated :("
          return
        else
          result = JSON.parse(body)
          msg.send "Got back #{result.list.url}"
```

# How to develop

## Required

### [Mac](http://www.apple.com/jp/mac/)

### [Homebrew](http://brew.sh/index_ja.html)

### Ruby

1. Install rbenv
https://github.com/sstephenson/rbenv#basic-github-checkout
2. Intall latest Ruby
```
rbenv install 2.2.2
rbenv global 2.2.2
gem install bundler
```

### MySQL

```
brew install mysql
```

### Terminal Notifier

To notify test result

```
brew install terminal-notifier
```

## Checkout and Setup

```
git clone git@github.com:bugcloud/chcklst.git
cd chcklst
bin/bundle install --path vendor/bundle
```

## Setup DB

```
bin/rake db:create
bin/rake db:migrate
```

### Start development

```
bin/rails s
```

Access http://localhost:3000

If you want to access using IP adress, type this.

```
bin/rails s -b 0.0.0.0
```
