require 'spec_helper'

describe UtopianRuby::UtopianRubyAPI do
  it "has moderators" do
    expect(UtopianRuby::UtopianRubyAPI.get_moderators()["results"].length).to be > 0
  end

  it "has is_moderator method" do
    expect(UtopianRuby::UtopianRubyAPI.is_moderator('elear')).to eq(true)
  end

  it "has is_moderator method" do
    expect(UtopianRuby::UtopianRubyAPI.is_moderator('ned')).to eq(false)
  end

  it "has sponsors" do
    expect(UtopianRuby::UtopianRubyAPI.get_sponsors()["results"].length).to be > 0
  end

  it "has is_sponsor method" do
    expect(UtopianRuby::UtopianRubyAPI.is_sponsor('elear')).to eq(false)
  end

  it "has is_sponsor method" do
    expect(UtopianRuby::UtopianRubyAPI.is_sponsor('ned')).to eq(true)
  end

  it "has stats" do
    expect(UtopianRuby::UtopianRubyAPI.stats()["stats"].length).to be > 0
  end

  it "has is_voting" do
    expect([true,false].include? UtopianRuby::UtopianRubyAPI.is_voting()).to eq(true)
  end
end
