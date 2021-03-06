require 'spec_helper'

describe UtopianRuby::UtopianRubyAPI do
  it "has get_moderators" do
    expect(UtopianRuby::UtopianRubyAPI.get_moderators()["results"].length).to be > 0
  end

  it "has get_moderator" do
    expect(UtopianRuby::UtopianRubyAPI.get_moderator('elear')["account"]).to eq('elear')
  end

  it "has get_moderator" do
    expect(UtopianRuby::UtopianRubyAPI.get_moderator('ned')).to eq(nil)
  end

  it "has is_moderator method" do
    expect(UtopianRuby::UtopianRubyAPI.is_moderator('elear')).to eq(true)
  end

  it "has is_moderator method" do
    expect(UtopianRuby::UtopianRubyAPI.is_moderator('ned')).to eq(false)
  end

  it "has is_supervisor method" do
    expect(UtopianRuby::UtopianRubyAPI.is_supervisor('espoem')).to be(true)
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

  it "has get_posts" do
    expect(UtopianRuby::UtopianRubyAPI.get_posts({"limit":1})["results"].length).to eq(1)
  end

  it "has get_post" do
    expect(UtopianRuby::UtopianRubyAPI.get_post('espoem','old-moderated-posts-are-received-and-shown-instead-of-the-recent-one')['author']).to eq('espoem')
  end

  it "has post_count" do
    expect(UtopianRuby::UtopianRubyAPI.post_count(nil)).to be > 0
  end
  it "has get_moderators_obj" do
    expect(UtopianRuby::UtopianRubyAPI.get_moderators_obj().length).to be > 0
#    UtopianRuby::UtopianRubyAPI.get_moderators_obj().each do |m|
#      puts m.account
#    end
  end

  it "has get_moderator_obj" do
    expect(UtopianRuby::UtopianRubyAPI.get_moderator_obj('elear').account).to eq('elear')
  end

  it "has get_moderator_obj" do
    expect(UtopianRuby::UtopianRubyAPI.get_moderator_obj('ned')).to eq(nil)
  end

  it "has get_posts_obj" do
    expect(UtopianRuby::UtopianRubyAPI.get_posts_obj({"limit":1}).length).to eq(1)

#    UtopianRuby::UtopianRubyAPI.get_posts_obj({"limit":2}).each do |p|
#      puts p.author
#      puts p.moderator
#    end
  end

  it "has get_post_obj" do
    expect(UtopianRuby::UtopianRubyAPI.get_post_obj('espoem','old-moderated-posts-are-received-and-shown-instead-of-the-recent-one').author).to eq('espoem')
  end

  it "has get_categories" do
    expect(UtopianRuby::UtopianRubyAPI.get_categories().length).to be > 0
  end
end
