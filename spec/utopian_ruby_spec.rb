require 'utopian_ruby'

describe UtopianRubyTest do

  describe "get moderators" do
    context "given url" do
      expect(UtopianRuby.get_moderators().length>0)
    end
  end


end
