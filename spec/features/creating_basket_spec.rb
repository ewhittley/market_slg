require 'rails_helper'

RSpec.feature "Creating Baskets" do
  before do
    @user1 = User.create(email: "user1@market.com", password: "P@ssword")
    login_as(@user1)
  end

  scenario "a user creates a new basket" do
    visit "/"
    click_button "Create Basket"

    expect(page.current_path).to eq(basket_path("#{Basket.last.id}"))
  end

end
