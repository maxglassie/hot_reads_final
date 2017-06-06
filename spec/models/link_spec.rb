require "rails_helper"

RSpec.describe Link, type: :model do
  context "validations" do
    it { should validate_presence_of(:url) }
  end

  context "top_ranked" do
    it "it returns the top ranked links" do
      link_1 = Link.create(url: "http://www.google.com", read: true)
      link_2 = Link.create(url: "http://www.google.com", read: true)
      link_3 = Link.create(url: "http://www.google.com", read: true)

      link_4 = Link.create(url: "http://www.yahoo.com", read: true)
      link_5 = Link.create(url: "http://www.yahoo.com", read: true)

      link_6 = Link.create(url: "http://www.nytimes.com", read: true)

      returned = Link.top_most_read
      expected_first = "http://www.google.com"
      expected_last = "http://www.nytimes.com"


      expect(returned[0]["url"]).to eq(expected_first)
      expect(returned[2]["url"]).to eq(expected_last)
    end
  end

  context "number_one?" do
    it "it says if the url is the top ranked" do
      link_1 = Link.create(url: "http://www.google.com", read: true)
      link_2 = Link.create(url: "http://www.google.com", read: true)
      link_3 = Link.create(url: "http://www.google.com", read: true)

      link_4 = Link.create(url: "http://www.yahoo.com", read: true)
      link_5 = Link.create(url: "http://www.yahoo.com", read: true)

      link_6 = Link.create(url: "http://www.nytimes.com", read: true)

      top_ranked = link_1.number_one?
      expected = true

      expect(top_ranked).to eq(expected)
    end
  end

  context "top_ten?" do
    it "it says if the url is in the top ten" do
      link_1 = Link.create(url: "http://www.google.com", read: true)
      link_2 = Link.create(url: "http://www.google.com", read: true)
      link_3 = Link.create(url: "http://www.google.com", read: true)

      link_4 = Link.create(url: "http://www.yahoo.com", read: true)
      link_5 = Link.create(url: "http://www.yahoo.com", read: true)

      link_6 = Link.create(url: "http://www.nytimes.com", read: true)

      top_ten = link_1.top_ten?
      expected = true

      expect(top_ten).to eq(expected)
    end
  end
end