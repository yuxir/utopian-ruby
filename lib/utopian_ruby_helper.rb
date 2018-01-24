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
  end
end

