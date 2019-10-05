@category_sizes=CategorySize.all
(1..2).each do |m|
  @category_sizes.each.with_index(1) do |category_size,n|
    @item=Item.create!(name:"商品#{m}-#{n}_のカテゴリは"+Category.find(category_size.category_id).name,
                        text:Size.find(category_size.size_id).kind+"からサイズを選んでます",
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