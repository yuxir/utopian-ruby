require 'faraday'
require 'addressable'
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

    def self.get_url_parameters(params)
      uri = Addressable::URI.new
      uri.query_values = params
      uri.query
    end

    # list all Utopian moderators
    def self.get_moderators()
      JSON.parse(get_request('/api/moderators').body)
    end

    # check if a user is a moderator
    def self.is_moderator(user)
      get_moderators()["results"].each do |moderator|
        if moderator['account']==user
          return true
        end
      end
      false
    end

    # check if a user is an utopian supervisor
    def self.is_supervisor(user)
      get_moderators()["results"].each do |moderator|
        if moderator['account']==user and moderator['supermoderator']
          return true
        end
      end
      false
    end

    # get a particular moderator's metadata
    def self.get_moderator(user)
      get_moderators()["results"].each do |moderator|
        if moderator['account']==user
          return moderator
        end
      end
      nil
    end

    # return sponsor list
    def self.get_sponsors()
      JSON.parse(get_request('/api/sponsors').body)
    end

    # check if a user is an utopian sponsor
    def self.is_sponsor(user)
      get_sponsors()["results"].each do |sponsor|
        if sponsor['account']==user
          return true
        end
      end
      false
    end

    # return Utopian current stats
    def self.stats()
      JSON.parse(get_request('/api/stats').body)
    end

    # return if Utopian is currently voting
    def self.is_voting()
      self.stats()["stats"]["bot_is_voting"]
    end

    # return JSON containing all post information that satisfies params
    def self.get_posts(params=nil)
      if params.nil?
         params = {}
      end
      JSON.parse(get_request('/api/posts?'+get_url_parameters(params)).body)
    end

    # return a particular post information
    def self.get_post(author,permlink)
      JSON.parse(get_request('/api/posts/'+author+'/'+permlink).body)
    end
  end
end
