require 'rails_helper'

RSpec.feature "Adding Basket Items to Basket" do
  before do
    @user1 = User.create(email: "user1@market.com", password: "P@ssword")

    @product1 = Product.create(code: "EG1", name: "Eggs", price: 1.23)

    @basket1 = Basket.create(user: @user1)
  end

  scenario "a user adds a basket item to their basket" do
    login_as(@user1)
    visit "/baskets/#{@basket1.id}"
    select("EG1", from: "basket_items_product_id")

    expect{
      click_button "Add Item"
    }.to change(Basket_item, :count).by(1)

    expect(page).to have_content(@product1.code)
    expect(page).to have_content(@product1.price)
    expect(page.current_path).to eq(basket_path(@basket1.id))
  end
end
