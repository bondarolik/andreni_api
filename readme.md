# Ruby Gem for Andreani API

## Install

Install gem into your local development machine or use it as a gem in your Ruby on Rails app.

```ruby
# Local environment
gem install andreani_api


# Ruby on Rails (Gemfile)
gem 'andreani_api'
```

## Usage

To work with Andreani RESTFull API V1 you need to have token. This token you can obtain by passing the `user` and `pass`. Set `sandbox` as `true` or `false`.

```ruby
# Sandbox true will point to QA (test) environment of Andreani API
user, pass, sandbox = "your_user", "your_password", true

# Get token
token = AndreaniApi::Auth.new(user, pass, sandbox).get_token
```

For production no need to define `sandbox` variable.


## License and credits
