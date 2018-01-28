require 'utopian_ruby_api'

module UtopianRuby
  class UtopianRubyHelper
    # get posts by type
    def self.get_posts_by_type(type,params)
      if params.nil?
         params = {"limit":1}
      end
      params["type"]=type
      UtopianRuby::UtopianRubyAPI.get_posts(params)
    end

    # get posts object by type
    def self.get_posts_obj_by_type(type,params)
      if params.nil?
         params = {"limit":1}
      end
      params["type"]=type
      UtopianRuby::UtopianRubyAPI.get_posts_obj(params)
    end

    # get posts by moderator
    def self.get_posts_obj_by_moderator(moderator,params)
      if params.nil?
         params = {"limit":1}
      end
      posts = Set.new
      UtopianRuby::UtopianRubyAPI.get_posts(params)["results"].each do |p|
        if p["moderator"]==moderator
          posts << UtopianRuby::UtopianRubyAPI.j_to_p(p)
        end
      end
      posts
    end

    # get post github repository
    def self.get_post_repository(author,permlink)
      p = UtopianRuby::UtopianRubyAPI.get_post(author,permlink)
      p["json_metadata"]["repository"]["html_url"]
    end
  end
end

