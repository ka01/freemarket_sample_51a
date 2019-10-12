@category=Category.find_by(name:"国内自動車本体")
@brand_group=BrandGroup.find_by(name:"国内自動車本体")

unless CategoryBrandGroup.find_by(category_id: @category[:id])
CategoryBrandGroup.create(category_id: @category[:id],brand_group_id: @brand_group[:id])
end

@category=Category.find_by(name:"外国自動車本体")
@brand_group=BrandGroup.find_by(name:"外国自動車本体")

unless CategoryBrandGroup.find_by(category_id: @category[:id])
CategoryBrandGroup.create(category_id: @category[:id],brand_group_id: @brand_group[:id])
end

@categories=Category.find_by(name:'キッチン/食器').subtree
@brand_group=BrandGroup.find_by(name:'キッチン・食器')

@categories.each do |category|
  unless CategoryBrandGroup.find_by(category_id: category[:id])
  CategoryBrandGroup.create(category_id: category[:id],brand_group_id: @brand_group[:id])
  end
end

@categories=Category.find_by(name:"時計").subtree
@brand_group=BrandGroup.find_by(name:"時計")

@categories.each do |category|
  unless CategoryBrandGroup.find_by(category_id: category[:id])
  CategoryBrandGroup.create(category_id: category[:id],brand_group_id: @brand_group[:id])
  end
end

@categories=Category.find_by(name:"テレビゲーム").subtree
@brand_group=BrandGroup.find_by(name:"テレビゲーム")

@categories.each do |category|
  unless CategoryBrandGroup.find_by(category_id: category[:id])
  CategoryBrandGroup.create(category_id: category[:id],brand_group_id: @brand_group[:id])
  end
end


@category=Category.find_by(name:"オートバイ車体")
@brand_group=BrandGroup.find_by(name:"バイク")

unless CategoryBrandGroup.find_by(category_id: @category[:id])
CategoryBrandGroup.create(category_id: @category[:id],brand_group_id: @brand_group[:id])
end

@categories=Category.find_by(name:'オートバイパーツ').subtree
@brand_group=BrandGroup.find_by(name:'バイク')

@categories.each do |category|
  unless CategoryBrandGroup.find_by(category_id: category[:id])
  CategoryBrandGroup.create(category_id: category[:id],brand_group_id: @brand_group[:id])
  end
end

@categories=Category.find_by(name:'オートバイアクセサリー').subtree
@brand_group=BrandGroup.find_by(name:'バイク')

@categories.each do |category|
  unless CategoryBrandGroup.find_by(category_id: category[:id])
  CategoryBrandGroup.create(category_id: category[:id],brand_group_id: @brand_group[:id])
  end
end

@categories=Category.find_by(name:'楽器/器材').subtree
@brand_group=BrandGroup.find_by(name:'楽器')

@categories.each do |category|
  unless CategoryBrandGroup.find_by(category_id: category[:id])
  CategoryBrandGroup.create(category_id: category[:id],brand_group_id: @brand_group[:id])
  end
end

@categories=Category.find_by(name:'自動車タイヤ/ホイール').subtree
@brand_group=BrandGroup.find_by(name:'自動車パーツ')

@categories.each do |category|
  unless CategoryBrandGroup.find_by(category_id: category[:id])
  CategoryBrandGroup.create(category_id: category[:id],brand_group_id: @brand_group[:id])
  end
end

@categories=Category.find_by(name:'自動車パーツ').subtree
@brand_group=BrandGroup.find_by(name:'自動車パーツ')

@categories.each do |category|
  unless CategoryBrandGroup.find_by(category_id: category[:id])
  CategoryBrandGroup.create(category_id: category[:id],brand_group_id: @brand_group[:id])
  end
end

@categories=Category.find_by(name:'自動車アクセサリー').subtree
@brand_group=BrandGroup.find_by(name:'自動車パーツ')

@categories.each do |category|
  unless CategoryBrandGroup.find_by(category_id: category[:id])
  CategoryBrandGroup.create(category_id: category[:id],brand_group_id: @brand_group[:id])
  end
end

@categories=Category.find_by(name:'食品').subtree
@brand_group=BrandGroup.find_by(name:'食品')

@categories.each do |category|
  unless CategoryBrandGroup.find_by(category_id: category[:id])
  CategoryBrandGroup.create(category_id: category[:id],brand_group_id: @brand_group[:id])
  end
end

@categories=Category.find_by(name:'レディース').subtree
@brand_group=BrandGroup.find_by(name:'レディース')

@categories.each do |category|
  unless CategoryBrandGroup.find_by(category_id: category[:id])
  CategoryBrandGroup.create(category_id: category[:id],brand_group_id: @brand_group[:id])
  end
end

@categories=Category.find_by(name:'メンズ').subtree
@brand_group=BrandGroup.find_by(name:'メンズ')

@categories.each do |category|
  unless CategoryBrandGroup.find_by(category_id: category[:id])
  CategoryBrandGroup.create(category_id: category[:id],brand_group_id: @brand_group[:id])
  end
end

@categories=Category.find_by(name:'ベビー・キッズ').subtree
@brand_group=BrandGroup.find_by(name:'ベビー・キッズ')

@categories.each do |category|
  unless CategoryBrandGroup.find_by(category_id: category[:id])
  CategoryBrandGroup.create(category_id: category[:id],brand_group_id: @brand_group[:id])
  end
end

@categories=Category.find_by(name:'インテリア・住まい・小物').subtree
@brand_group=BrandGroup.find_by(name:'インテリア・住まい・雑貨')

@categories.each do |category|
  unless CategoryBrandGroup.find_by(category_id: category[:id])
  CategoryBrandGroup.create(category_id: category[:id],brand_group_id: @brand_group[:id])
  end
end

@categories=Category.find_by(name:'コスメ・香水・美容').subtree
@brand_group=BrandGroup.find_by(name:'コスメ・香水・美容')

@categories.each do |category|
  unless CategoryBrandGroup.find_by(category_id: category[:id])
  CategoryBrandGroup.create(category_id: category[:id],brand_group_id: @brand_group[:id])
  end
end

@categories=Category.find_by(name:'スポーツ・レジャー').subtree
@brand_group=BrandGroup.find_by(name:'スポーツ・レジャー')

@categories.each do |category|
  unless CategoryBrandGroup.find_by(category_id: category[:id])
  CategoryBrandGroup.create(category_id: category[:id],brand_group_id: @brand_group[:id])
  end
end

@categories=Category.find_by(name:'家電・スマホ・カメラ').subtree
@brand_group=BrandGroup.find_by(name:'スマートフォン・携帯電話')

@categories.each do |category|
  unless CategoryBrandGroup.find_by(category_id: category[:id])
  CategoryBrandGroup.create(category_id: category[:id],brand_group_id: @brand_group[:id])
  end
end
