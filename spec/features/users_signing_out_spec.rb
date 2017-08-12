require 'rails_helper'

RSpec.feature "Users Signing Out" do
  before do
    @user1 = User.create(email: "user1@market.com", password: "P@ssword")
    login_as(@user1)
  end

  scenario "a user signs out" do
    visit "/"
    click_link "Sign out"

    expect(page).to have_content("Sign in")
    expect(page).to have_content("Sign up")
    expect(page).not_to have_content("Sign out")
    expect(page).not_to have_content("#{@user1.email}")
  end
end
