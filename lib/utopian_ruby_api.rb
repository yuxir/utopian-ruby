require 'faraday'
require 'json'

module UtopianRuby
  class UtopianRubyAPI
    @@host = 'https://api.utopian.io'

    def self.get_connection()
      conn = Faraday.new(:url => @@host) do |c|
        c.use Faraday::Request::UrlEncoded 
        #c.use Faraday::Response::Logger     
        c.use Faraday::Adapter::NetHttp     
      end
    end

    def self.get_moderators()
      path = '/api/moderators'
      response = get_connection().get path
      moderators = JSON.parse(response.body)
    end
  end
end
