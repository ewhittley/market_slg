require 'rails_helper'

RSpec.feature "Users Signing In" do
  before do
    @user1 = User.create(email: "user1@market.com", password: "P@ssword")
  end

  scenario "a user signs in with valid credentials" do
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: "user1@market.com"
    fill_in "Password", with: "P@ssword"
    click_button "Log in"

    expect(page).to have_content("#{@user1.email}")
    expect(page).to have_content("Sign out")
    expect(page).not_to have_content("Sign up")
    expect(page).not_to have_content("Sign in")
  end

  scenario "a user signs in with invalid credentials" do
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    click_button "Log in"

    expect(page).to have_content("Sign up")
    expect(page).to have_content("Sign in")
    expect(page).not_to have_content("Sign out")
    expect(page).not_to have_content("#{@user1.email}")
  end
end
