# Chcklst

チェックリストを生成するだけのWebアプリケーションプロトタイプ

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
git clone git@gitlab.so-ra.co.jp:y.nagino/chcklst.git
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
