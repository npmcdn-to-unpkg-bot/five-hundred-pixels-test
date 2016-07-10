require "rails_helper"

describe FlashesHelper do
  describe "#user_facing_flashes" do
    it "returns hash" do
      expect(helper.user_facing_flashes).to eq({})
    end
  end
end
