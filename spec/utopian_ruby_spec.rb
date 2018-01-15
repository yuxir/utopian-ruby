require 'spec_helper'

describe UtopianRuby::UtopianRubyAPI do
  it "has moderators" do
    expect(UtopianRuby::UtopianRubyAPI.get_moderators()["results"].length).to be > 0
  end
end
