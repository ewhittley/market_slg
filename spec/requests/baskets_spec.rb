require 'rails_helper'

RSpec.describe "Baskets", type: :request do

  before do
    @user1 = User.create(email: "user1@market.com", password: "P@ssword")
    @user2 = User.create(email: "user2@market.com", password: "P@ssword")

    @basket1 = Basket.create(user: @user1)
  end

  describe "GET/baskets/:id" do
    context "with a basket that does not exist" do
      before { get "/baskets/xxxx" }

      it "handles non-existing basket" do
        expect(response.status).to eq 302
      end
    end

    context "with a basket that belongs to current user" do
      before do
        login_as(@user1)
        get "/baskets/#{@basket1.id}"
      end

      it "successfully displays basket" do
        expect(response.status).to eq 200
      end
    end

    context "with a basket that does not belong to current user" do
      before do
        login_as(@user2)
        get "/baskets/#{@basket1.id}"
      end

      it "does not allow user to see basket they are not owner of" do
        expect(response.status).to eq 302
      end
    end

    context "with a user who is not signed in" do
      before do
        get "/baskets/#{@basket1.id}"
      end

      it "does not allow user to see basket they are not owner of" do
        expect(response.status).to eq 302
      end
    end
  end

  describe "DELETE/baskets/:id" do
    context "with a basket that does not exist" do
      before { delete "/baskets/xxxx" }

      it "handles non-existing basket" do
        expect(response.status).to eq 302
      end
    end

    context "with a basket that belongs to current user" do
      before do
        login_as(@user1)
        delete "/baskets/#{@basket1.id}"
      end

      it "successfully deletes basket" do
        expect(response.status).to eq 302
      end
    end

    context "with a basket that does not belong to current user" do
      before do
        login_as(@user2)
        delete "/baskets/#{@basket1.id}"
      end

      it "does not allow user to delete basket they are not owner of" do
        expect(response.status).to eq 302
      end
    end

    context "with a user who is not signed in" do
      before do
        delete "/baskets/#{@basket1.id}"
      end

      it "does not allow user to delete basket they are not owner of" do
        expect(response.status).to eq 302
      end
    end
    end
  end
end
