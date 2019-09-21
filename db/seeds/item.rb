@category_sizes=CategorySize.all
(1..5).each do |m|
  @category_sizes.each.with_index(1) do |category_size,n|
    @item=Item.create!(name:"商品#{m}-#{n}_のカテゴリは"+Category.find(category_size.category_id).name,
                        text:Size.find(category_size.size_id).kind+"からサイズを選んでます",
                        price:300,
                        condition:0,
                        category_id:category_size.category_id,
                        trading_status:0,
                        size_id:category_size.size_id,
                        brand_id:Brand.where( 'id >= ?', rand(Brand.first.id..Brand.last.id) ).first.id,
                        seller_id:1)
    ItemImage.create!(item_id: @item.id,
                      image_url: open("#{Rails.root}/db/fixtures/sample.jpeg"))
  end
end