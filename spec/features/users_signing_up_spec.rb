require 'rails_helper'

RSpec.feature "Users Signing Up" do
  scenario "a user signs up with valid credentials" do
    visit "/"
    click_link "Sign Up"
    fill_in "Email", with: "user@market.com"
    fill_in "Password", with: "P@ssword"
    fill_in "Password confirmation", with: "P@ssword"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully")
  end

  scenario "a user signs up with invalid credentials" do
    visit "/"
    click_link "Sign Up"
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""
    click_button "Sign up"

    expect(page).to have_content("You have not signed up successfully")
  end
end
