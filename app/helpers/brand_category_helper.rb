module BrandCategoryHelper
  def brand_category_first_sentence(brand,category,items)
    return "#{brand.name} #{category.name}の商品は#{items.length}点以上あります。"
  end

  def brand_category_second_sentence(items)
    return "人気のある商品は「#{items[0].name if items[0]}」や「#{items[1].name if items[1]}」や「#{items[2].name if items[2]}」があります。"
  end

  def brand_category_third_sentence(brand,category,items)
      return "これまでに#{brand.name} #{category.name}で出品された商品は#{items.length}点以上あります。"
  end

  def discription_brand_category_text(brand,category,items)
    brand_category_first_sentence(brand,category,items)+
    brand_category_second_sentence(items)+
    brand_category_third_sentence(brand,category,items)
  end

end
