require 'rails_helper'

RSpec.describe "Products", type: :request do

  before do
    @user1 = User.create(email: "user1@market.com", password: "P@ssword")
    @user2 = User.create(email: "user2@market.com", password: "P@ssword")

    @product1 = Product.create(code: "EG1", name: "Eggs", price: 1.23)
  end

  describe 'GET/products/:id' do
    context "with a product that does not exist" do
      before { get "/products/xxxx" }

      it "handles non-existing product" do
        expect(response.status).to eq 302
        flash_message = "Product does not exist"
        expect(flash[:alert]).to eq flash_message
      end
    end

    context "with a user who is signed in and a product that does exist" do
      before do
        login_as(@user1)
        get "/products/#{@product1.id}"
      end

      it "successfully displays product" do
        expect(response.status).to eq 200
      end
    end

    context "with a user who is not signed in" do
      before do
        get "/products/#{@product1.id}"
      end

      it "does not allow user to see product" do
        expect(response.status).to eq 302
        flash_message = "You must sign in before viewing a product"
        expect(flash[:alert]).to eq flash_message
      end
    end
  end

  describe 'DELETE/products/:id' do

  end
end
