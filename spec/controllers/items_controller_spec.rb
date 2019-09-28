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

  describe 'GET #search' do
    before do
      @category_sizes=CategorySize.all
      @category_sizes.each.with_index(1) do |category_size,n|
        @item=Item.create!(name:"hoge",
                            text:"hoge",
                            price:rand(300..20000),
                            condition:rand(6),
                            category_id:category_size.category_id,
                            trading_status:rand(4),
                            size_id:Size.find(category_size.size_id).children.first.id,
                            brand_id:Brand.where( 'id >= ?', rand( Brand.first.id..Brand.last.id) ).first.id,
                            seller_id:User.where( 'id >= ?', rand( User.find(1).id..User.find(2).id) ).first.id,
        )
        if @item.read_attribute_before_type_cast(:trading_status) > 1
          @item.update(
            buyer_id:User.where.not(id:@item.seller_id).where( 'id >= ?', rand( User.first.id..User.last.id) ).first.id
          )
          Purchase.create!(item_id:@item.id,
            seller_id:@item.seller_id,
            buyer_id:@item.buyer_id
          )
        end
    
        ItemImage.create!(item_id: @item.id,
                          image_url: open("#{Rails.root}/db/fixtures/sample.jpeg")
        )
        Shipping.create!(item_id: @item.id,
                          fee_burden:rand(2),
                          service: rand(9),
                          area: rand(1..47),
                          handling_time: rand(3)
        )
      end
    end

    context "with keywords" do

      # キーワード：nameにヒットする場合
      context "of name" do

        # @search_resultという変数が正しく定義されているか
        it "assigns the requested search_result to @search_result" do
          get :search, params: { q: { name_cont: "hoge" } }
          expect(assigns(:search_result)).to match_array(@item)
        end
      end

      # キーワード：ヒットしない場合
      context "not match" do

        # @search_resultという変数が正しく定義されているか
        it "assigns the requested search_result to []" do
          get :search, params: { q: { name_cont: "not_match" } }
          expect(assigns(:search_result)).to match_array([])
        end
      end

      # 該当するビューが描画されているか
      it "renders the :search template" do
        get :search, params: { q: { name_cont: "hoge" } }
        expect(response).to render_template :search
      end
    end
  end

end
