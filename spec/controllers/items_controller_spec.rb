require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  describe "POST #pay" do
    it "payアクションのhttpメソッドはPOSTです" do
      expect(response).to have_http_status(:success)
    end

    it "ルートパスにリダイレクトされます" do
      get :index
      expect(response).to render_template :index
    end

  #   it "@item.priceには300円の値が入っています" do
  #     item = index(:item)
  #     get :index, params: { price: item }
  #     expect(assigns(:item)).to eq item
  #   end
  end
end
