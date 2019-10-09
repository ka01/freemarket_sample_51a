module BrandHelper
  def first(brand,items)
    return "#{brand.name}の商品は#{items.length}点以上あります。"
  end

  def second(items)
    return "人気のある商品は「#{items[0].name if items[0]}」や「#{items[1].name if items[1]}」や「#{items[2].name if items[2]}」があります。"
  end

  def third(brand,items)
      return "これまでに#{brand.name}で出品された商品は#{items.length}点以上あります。"
  end

  def discription_brand_text(brand,items)
    first(brand,items)+
    second(items)+
    third(brand,items)
  end

end
