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

    def self.get_request(endpoint)
      get_connection().get endpoint
    end

    def self.get_moderators()
      JSON.parse(get_request('/api/moderators').body)
    end

    def self.is_moderator(user)
      get_moderators()["results"].each do |moderator|
        if moderator['account']==user
          return true
        end
      end
      false
    end

    def self.get_sponsors()
      JSON.parse(get_request('/api/sponsors').body)
    end

    def self.is_sponsor(user)
      get_sponsors()["results"].each do |sponsor|
        if sponsor['account']==user
          return true
        end
      end
      false
    end

    def self.stats()
      JSON.parse(get_request('/api/stats').body)
    end

    def self.is_voting()
      self.stats()["stats"]["bot_is_voting"]
    end
  end
end
