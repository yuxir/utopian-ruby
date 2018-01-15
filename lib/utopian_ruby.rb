require 'faraday'

class UtopianRuby
  @@host = 'https://api.utopian.io'

  def self.get_connection()
    conn = Faraday.new(:url => @@host) do |c|
      c.use Faraday::Request::UrlEncoded 
      c.use Faraday::Response::Logger     
      c.use Faraday::Adapter::NetHttp     
    end
  end

  def self.list_moderators()
    path = '/api/moderators'
    response = get_connection().get path
    puts response.body.inspect
  end

end
