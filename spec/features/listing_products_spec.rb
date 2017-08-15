require 'rails_helper'

RSpec.feature "Listing Products" do
  before do
    @user1 = User.create(email: "user1@market.com", password: "P@ssword")

    @product1 = Product.create(code: "EG1", name: "Eggs", price: 1.23)
    @product2 = Product.create(code: "OJ1", name: "Orange Juice", price: 3.21)
  end

  scenario "a user lists all available products" do
    login_as(@user1)
    visit "/products"

    expect(page).to have_content(@product1.code)
    expect(page).to have_content(@product1.name)
    expect(page).to have_content(@product1.price)
    expect(page).to have_content(@product1.code)
    expect(page).to have_content(@product1.name)
    expect(page).to have_content(@product1.price)
  end
end
