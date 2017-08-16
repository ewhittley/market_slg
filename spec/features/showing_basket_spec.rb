require 'rails_helper'

RSpec.feature "Showing Baskets" do
  before do
    @user1 = User.create(email: "user1@market.com", password: "P@ssword")
  end

  scenario "a user shows an existing basket" do
    login_as(@user1)
    visit "/"
    click_link "Basket"

    expect(page.current_path).to eq(basket_path(current_basket))
  end

end
