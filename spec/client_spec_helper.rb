require 'config_loader'
require 'napster'

module ClientSpecHelper
  # prepares a client that is able to call Napster API
  def self.get_client(includes = [])
    yaml = ConfigLoader.init['config_variables']
    client_options = {
      api_key: yaml['API_KEY'],
      api_secret: yaml['API_SECRET']
    }
    includes.each do |include|
      if include == 'username'
        client_options[:username] = yaml['USERNAME']
      elsif include == 'password'
        client_options[:password] = yaml['PASSWORD']
      end
    end
    Napster::Client.new(client_options)
  end
end
