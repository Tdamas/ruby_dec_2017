require 'rails_helper'

RSpec.describe User, type: :model do
  #Testing context for valid information
  context "has valid information" do
    it "should save" do
      # To DO
    end
  end
  # Testing for when a User has invalid information
  context "has invalid information" do
    before(:each) do
      @user = User.new(
        first_name:"",
        last_name:"",
        email:"",
      )
    end
    it "first_name is blank" do
      expect(@user).to be_invalid
    end
    it "last_name is blank" do
      expect(@user).to be_invalid
    end
    it "email is blank" do
      expect(@user).to be_invalid
    end
    it "email field is invalid" do
      user = User.new(
            first_name: 'shane',
            last_name: 'chang',
            email: 'schangcodingdojo'
        )
      expect(user).to be_invalid
    end
  end
end
