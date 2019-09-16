module CategoryHelper
  def discription_name(category)
    if category.depth==0
      return category.name
    else
      return "#{category.name}(#{category.root.name})"
    end
  end

  def first_sentence(category)
    if category.root.name=="レディース"||category.root.name=="メンズ"
      return "の着ない服、いらない洋服を売るならメルカリへ。"
    elsif category.root.name=="ベビー・キッズ"
      return "の買取、処分ならメルカリへ。"
    elsif category.root.name=="インテリア・住まい・小物"
      return "の処分、買取ならメルカリへ。"
    elsif category.root.name=="本・音楽・ゲーム"||category.root.name=="家電・スマホ・カメラ"
      return "の買い取り、売るならメルカリへ。"
    elsif category.root.name=="おもちゃ・ホビー・グッズ"
      return "のならメルカリへ。"
    elsif category.root.name=="コスメ・香水・美容"
      return "の買取ならメルカリへ。"
    else
      return "の買い取り、売るならメルカリへ。"
    end
  end

  def second_sentence(category,items)
    if category.depth==0
      return "#{category.name}の商品は#{items.length}点以上あります。"
    else
      return "#{category.name}は#{category.parent.name}の下にあるカテゴリで商品は#{items.length}点以上あります。"
    end
  end

  def third_sentence(category)
    if category.depth==0
      return "人気のあるカテゴリーは#{category.indirects.sort_by{rand}[0].name}と#{category.indirects.sort_by{rand}[0].name}です。"
    elsif category.depth==1
      if category.children
        return "よく見られているカテゴリーは#{category.children.sort_by{rand}[0].name}と#{category.children.sort_by{rand}[0].name}です。特に"
      else
        return "特に"
      end
    else
      return "特に"
    end
  end

  def forth_sentence(items)
    return "人気の商品は「#{items[0].name if items[0]}」や「#{items[1].name if items[1]}」や「#{items[2].name if items[2]}」があります。"
  end

  def fifth_sentence(category)
    if category.root.name=="レディース"||category.root.name=="メンズ"
      return "の買い取りやリサイクル処分、服の整理を検討中の方にお勧めです"
    elsif category.root.name=="ベビー・キッズ"
      return "の買い取りやリサイクル、子供服の整理を検討中の方にお勧めです"
    elsif category.root.name=="インテリア・住まい・小物"
      return "のリサイクルや売ることを検討中の方にお勧めです"
    elsif category.root.name=="本・音楽・ゲーム"
      return "の処分や整理、売却を検討中の方にお勧めです"
    elsif category.root.name=="家電・スマホ・カメラ"
      return "リサイクルや売却、売り方や処分を検討中の方にお勧めです。"
    elsif category.root.name=="おもちゃ・ホビー・グッズ"
      return "のを検討中の方にお勧めです。"
    elsif category.root.name=="コスメ・香水・美容"||category.root.name=="自動車・オートバイ"
      return "の売り方や整理を検討中の方にお勧めです。"
    elsif category.root.name=="チケット"
      return "売り方や売却を検討中の方にお勧めです。"
    else
      return "リサイクルや処分、整理を検討中の方にお勧めです。"
    end
  end


  def discription_text(category,items)
    return"#{category.name}"+
    first_sentence(category)+
    second_sentence(category,items)+
    third_sentence(category)+
    forth_sentence(items)+
    "#{category.name}"+
    fifth_sentence(category)
  end

end
