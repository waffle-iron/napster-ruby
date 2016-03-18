# Napster Gem

A Ruby interface to the [Napster/Rhapsody API](https://developer.rhapsody.com/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'napster'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install napster

## Usage

### Setting up a client

A **client** prepares you to make calls to Napster/Rhapsody API.
Here is an example code for setting up a client using
[implicit method](https://developer.rhapsody.com/api#authentication).

``` ruby
require 'napster'

options = {
  api_key: 'API_KEY',
  api_secret: 'API_SECRET',
}

client = Napster::Client.new(options)
```

### Getting an access token

#### Password grant

```ruby
client_hash = {
  api_key: 'API_KEY',
  api_secret: 'API_SECRET',
  username: 'USERNAME',
  password: 'PASSWORD'
}

client = Napster::Client.new(client_hash)
client.password_grant

client.authentication.access_token # => returns access_token
client.authentication.refresh_token
client.authentication.expires_in
```

#### OAuth 2

```ruby
client_hash = {
  api_key: 'API_KEY',
  api_secret: 'API_SECRET',
  redirect_uri: 'REDIRECT_URI',
  auth_code: 'AUTH_CODE'
}

client = Napster::Client.new(client_hash)
client.connect

client.authentication.access_token # => returns access_token
client.authentication.refresh_token
client.authentication.expires_in
```

## Development

### Running tests

Napster gem uses RSpec and FactoryGirl.

Rhapsody gem uses RSpec and FactoryGirl.

1. Get the API key and API secret from
[Rhapsody Developers site](https://developer.rhapsody.com/).

2. Create a file called `config.yml` in `spec` directory.

3. Add the following with the correct API key and API secret

``` yml
config_variables:
  API_KEY: 'API_KEY'
  API_SECRET: 'API_SECRET'
  USERNAME: 'USERNAME'
  PASSWORD: 'PASSWORD'
  REDIRECT_URI: 'REDIRECT_URI'
```

4. `$ bundle install`

5. `$ rspec`


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/napster.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).