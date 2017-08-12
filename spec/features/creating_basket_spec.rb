require 'rails_helper'

RSpec.feature "Creating Baskets" do
  before do
    @user1 = User.create(email: "user1@market.com", password: "P@ssword")
  end

  scenario "a user creates a new basket" do
    login_as(@user1)
    visit "/"
    click_button "Create Basket"

    expect(page.current_path).to eq(basket_path("#{Basket.last.id}"))
  end

  scenario "a user can create a basket while signed in" do
    login_as(@user1)
    visit "/"

    expect(page).to have_content("Create Basket")
  end

  scenario "a user cannot create a basket while signed out" do
    visit "/"

    expect(page).not_to have_content("Create Basket")
    expect(page).to have_content("You must Sign up or Sign in to create a basket")
  end

end
