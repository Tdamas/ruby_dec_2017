require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = build(:user)
  end

  context "has valid information" do
    it "should save" do

    end
  end

  context "has invalid information" do
    it "first_name is blank" do
      @user.first_name = ""
      expect(@user).to be_invalid
    end

    it "last_name is blank" do
      @user.last_name = ""
      expect(@user).to be_invalid
    end

    it "email is blank" do
      @user.email = ""
      expect(@user).to be_invalid
    end
    it "email is invalid" do
      # to test against regex
      @user.email = "johnsmith"
      expect(@user).to be_invalid
    end
  end
end
