require 'spec_helper'
require 'utopian_ruby_helper'

describe UtopianRuby::UtopianRubyHelper do
  it "has get_posts_by_type" do
    expect(UtopianRuby::UtopianRubyHelper.get_posts_by_type("development",{"limit":5})["results"].length).to eq(5)
  end
end
