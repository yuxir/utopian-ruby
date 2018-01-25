require 'spec_helper'
require 'utopian_ruby_helper'

describe UtopianRuby::UtopianRubyHelper do
  it "has get_posts_by_type" do
    expect(UtopianRuby::UtopianRubyHelper.get_posts_by_type("development",{"limit":5})["results"].length).to eq(5)
  end

  it "has get_posts_obj_by_type" do
    expect(UtopianRuby::UtopianRubyHelper.get_posts_obj_by_type("development",{"limit":5}).length).to eq(5)
    #UtopianRuby::UtopianRubyHelper.get_posts_obj_by_type("development",{"limit":5}).each do |p|
    #  puts p.author
    #  puts p.title
    #  puts p.permlink
    #end
  end

  it "has get_posts_obj_by_moderator" do
    expect(UtopianRuby::UtopianRubyHelper.get_posts_obj_by_moderator("helo",{"limit":10,"type":"development"}).class).to eq(Set)
    #UtopianRuby::UtopianRubyHelper.get_posts_obj_by_moderator("helo",{"limit":10,"type":"development"}).each do |p|
    #  puts p.permlink
    #end
  end

end
