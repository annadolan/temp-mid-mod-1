require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "invalid attributes" do

      it "is invalid without an email" do
        user = User.new(password: "password")
        expect(user).to be_invalid
      end

      it "is invalid without a password" do
        user = User.new(email: "bob@jones.com")
        expect(user).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        user = User.new(email: "bob@jones.com", password: "password")
        expect(user).to be_valid
      end
    end

    context "Uniqueness" do
      it "validates uniqueness of email" do
        User.create(email: "bob@jones.com", password: "password")
        user = User.new(email: "bob@jones.com", password: "password1")
        expect(user).to be_invalid
      end
    end
  end
end
