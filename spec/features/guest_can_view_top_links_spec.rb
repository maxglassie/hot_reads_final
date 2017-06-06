require "rails_helper"

RSpec.feature "User can visit the index page" do
  scenario "and submit a link and title" do
    link_1 = Link.create(url: "http://www.google.com", read: true)
    link_2 = Link.create(url: "http://www.google.com", read: true)
    link_3 = Link.create(url: "http://www.google.com", read: true)

    link_4 = Link.create(url: "http://www.yahoo.com", read: true)
    link_5 = Link.create(url: "http://www.yahoo.com", read: true)

    link_6 = Link.create(url: "http://www.nytimes.com", read: true)

    visit "/"

    expect(page).to have_content("http://www.google.com")
  end
end