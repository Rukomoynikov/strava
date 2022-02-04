require "rails_helper"

RSpec.feature "Widget management", :type => :feature do
  scenario "User creates a new widget" do
    visit "/"

    expect(page).to have_text("Auth via Strava")
  end
end
