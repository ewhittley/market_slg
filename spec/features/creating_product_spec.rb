require 'rails_helper'

RSpec.feature "Creating Product" do
  before do
    @user1 = User.create(email: "user1@market.com", password: "P@ssword")
  end

  scenario "a user creates a product while signed in" do
    login_as(@user1)
    visit "/"
    click_link "Products"

    expect(page.current_path).to eq(products_path)

    click_link "New Product"
    fill_in "Code", with: "EG1"
    fill_in "Name", with: "Eggs"
    fill_in "Price", with: "1.23"

    expect{
      click_button "Create Product"
    }.to change(Product, :count).by(1)

    expect(page.current_path).to eq(products_path)
  end

  scenario "a user fails to create a product while signed in" do
    login_as(@user1)
    visit "/"
    click_link "Products"

    expect(page.current_path).to eq(products_path)

    click_link "New Product"
    fill_in "Code", with: ""
    fill_in "Name", with: ""
    fill_in "Price", with: ""

    click_button "Create Product"

    expect(page).to have_content("Product has not been created.")
    # expect(page).to have_content("Code can't be blank")
    # expect(page).to have_content("Name can't be blank")
    # expect(page).to have_content("Price can't be blank")
  end

  scenario "a user attempts to create a product while not signed in" do
    visit "/"
    click_link "Products"

    expect(page.current_path).to eq(products_path)

    expect(page).not_to have_link("New Product")
    expect(page).to have_content("You must Sign up or Sign in to create a product")
  end
end
