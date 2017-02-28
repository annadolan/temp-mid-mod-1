require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        link = Link.new(url: "http://www.turing.io")
        expect(link).to be_invalid
      end

      it "is invalid without a url" do
        link = Link.new(title: "Turing")
        expect(link).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        link = Link.new(url: "http://www.turing.io", title: "Turing")
        expect(link).to be_valid
      end
    end
  end

  describe ".is_top_ten?" do
    it "identifies a link that is in the top ten" do
      read = ReadLink.create(url: "http://www.turing.io")
      link = Link.new(url: "http://www.turing.io", title: "Turing")

      expect(link.is_top_ten?).to eq(true)
    end
  end

  describe ".is_number_one?" do
    it "identifies the top link" do
      read = ReadLink.create(url: "http://www.turing.io")
      read2 = ReadLink.create(url: "http://www.ducks.com")
      link = Link.new(url: "http://www.turing.io", title: "Turing")

      expect(link.is_number_one?).to eq(true)
    end

    it "identifies only the top link" do
      read = ReadLink.create(url: "http://www.turing.io")
      read2 = ReadLink.create(url: "http://www.ducks.com")
      link = Link.new(url: "http://www.turing.io", title: "Turing")
      link2 = Link.new(url: "http://www.ducks.com", title: "dux")
      expect(link2.is_number_one?).to eq(false)
    end
  end
end
