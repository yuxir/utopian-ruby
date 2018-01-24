require 'faraday'
require 'addressable'
require 'json'
require 'moderator'
require 'post'

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

    # return total number of Utopian posts that satisfy params
    def self.post_count(params)
      if params.nil?
         params = {"limit":1}
      end
      get_posts(params)["total"]
    end

    def self.j_to_m(m)
        moderator = Moderator.new
        moderator._id                                 = m["_id"]
        moderator.account                             = m["account"]  unless m["account"].nil?
        moderator.referrer                            = m["referrer"] unless m["referrer"].nil?
        moderator.supermoderator                      = m["supermoderator"] unless m["supermoderator"].nil?
        moderator.reviewed                            = m["reviewed"] unless m["reviewed"].nil?
        moderator.banned                              = m["banned"] unless m["banned"].nil?
        moderator.total_moderated                     = m["total_moderated"] unless m["total_moderated"].nil?
        moderator.total_paid_rewards                  = m["total_paid_rewards"] unless m["total_paid_rewards"].nil?
        moderator.total_paid_rewards_steem            = m["total_paid_rewards_steem"] unless m["total_paid_rewards_steem"].nil?
        moderator.should_receive_rewards              = m["should_receive_rewards"] unless m["should_receive_rewards"].nil?
        moderator.percentage_total_rewards_moderators = m["percentage_total_rewards_moderators"] unless m["percentage_total_rewards_moderators"].nil?
        moderator
    end

    def self.get_moderators_obj()
      moderators = Set.new
      get_moderators()["results"].each do |m|
        moderators << j_to_m(m)
      end      
      moderators
    end

    def self.get_moderator_obj(user)
      get_moderators()["results"].each do |m|
        if m["account"] == user
          return j_to_m(m)
        end
      end
      return nil
    end

    def self.j_to_p(p)
      post = Post.new
      post._id                        = p["_id"]  unless p["_id"].nil?
      post.id                         = p["id"]  unless p["id"].nil?
      post.author                     = p["author"]  unless p["author"].nil?
      post.flagged                    = p["flagged"]  unless p["flagged"].nil?
      post.reviewed                   = p["reviewed"]  unless p["reviewed"].nil?
      post.pending                    = p["pending"]  unless p["pending"].nil?
      post.moderator                  = p["moderator"]  unless p["moderator"].nil?
      post.permlink                   = p["permlink"]  unless p["permlink"].nil?
      post.category                   = p["category"]  unless p["category"].nil?
      post.parent_author              = p["parent_author"]  unless p["parent_author"].nil?
      post.parent_permlink            = p["parent_permlink"]  unless p["parent_permlink"].nil?
      post.title                      = p["title"]  unless p["title"].nil?
      post.body                       = p["body"]  unless p["body"].nil?
      post.created                    = p["created"]  unless p["created"].nil?
      post.last_update                = p[""]  unless p["last_update"].nil?
      post.active                     = p["active"]  unless p["active"].nil?
      post.last_payout                = p["last_payout"]  unless p["last_payout"].nil?
      post.depth                      = p["depth"]  unless p["depth"].nil?
      post.children                   = p["children"]  unless p["children"].nil?
      post.net_rshares                = p["net_rshares"]  unless p["net_rshares"].nil?
      post.abs_rshares                = p["abs_rshares"]  unless p["abs_rshares"].nil?
      post.vote_rshares               = p["vote_rshares"]  unless p["vote_rshares"].nil?
      post.children_abs_rshares       = p["children_abs_rshares"]  unless p["children_abs_rshares"].nil?
      post.cashout_time               = p["cashout_time"]  unless p["cashout_time"].nil?
      post.max_cashout_time           = p["max_cashout_time"]  unless p["max_cashout_time"].nil?
      post.total_vote_weight          = p["total_vote_weight"]  unless p["total_vote_weight"].nil?
      post.reward_weight              = p["reward_weight"]  unless p["reward_weight"].nil?
      post.total_payout_value         = p["total_payout_value"]  unless p["total_payout_value"].nil?
      post.curator_payout_value       = p["curator_payout_value"]  unless p["curator_payout_value"].nil?
      post.author_rewards             = p["author_rewards"]  unless p["author_rewards"].nil?
      post.net_votes                  = p["net_votes"]  unless p["net_votes"].nil?  
      post.root_comment               = p["root_comment"]  unless p["root_comment"].nil?   
      post.max_accepted_payout        = p["max_accepted_payout"]  unless p["max_accepted_payout"].nil?
      post.percent_steem_dollars      = p["percent_steem_dollars"]  unless p["percent_steem_dollars"].nil?
      post.allow_replies              = p["allow_replies"]  unless p["allow_replies"].nil?
      post.allow_votes                = p["allow_votes"]  unless p["allow_votes"].nil?
      post.allow_curation_rewards     = p["allow_curation_rewards"]  unless p["allow_curation_rewards"].nil?
      post.url                        = p["url"]  unless p["url"].nil?      
      post.root_title                 = p["root_title"]  unless p["root_title"].nil?
      post.pending_payout_value       = p["pending_payout_value"]  unless p["pending_payout_value"].nil?
      post.total_pending_payout_value = p["total_pending_payout_value"]  unless p["total_pending_payout_value"].nil?      
      post.author_reputation          = p["author_reputation"]  unless p["author_reputation"].nil?
      post.promoted                   = p["promoted"]  unless p["promoted"].nil?
      post.body_length                = p["body_length"]  unless p["body_length"].nil?
      post.__v                        = p["__v"]  unless p["__v"].nil?
      post.reserved                   = p["reserved"]  unless p["reserved"].nil?
      post.json_metadata              = p["json_metadata"]  unless p["json_metadata"].nil?
      post.replies                    = p["replies"]  unless p["replies"].nil?
      post.reblogged_by               = p["reblogged_by"]  unless p["reblogged_by"].nil?
      post.beneficiaries              = p["beneficiaries"]  unless p["beneficiaries"].nil?      
      post.active_votes               = p["active_votes"]  unless p["active_votes"].nil?
      post
    end

    def self.get_posts_obj(params=nil)
      if params.nil?
         params = {}
      end

      posts = Set.new
      get_posts(params)["results"].each do |p|
        posts << j_to_p(p)
      end
      posts
    end

    def self.get_post_obj(author,permlink)
      j = JSON.parse(get_request('/api/posts/'+author+'/'+permlink).body)
      unless j.nil?
        return j_to_p(j)
      end
      return nil
    end
  end
end
