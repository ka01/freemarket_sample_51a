Dir.glob(File.join(Rails.root, 'db', 'seeds', 'category_size.rb')) do |file|
  load(file)
end
Dir.glob(File.join(Rails.root, 'db', 'seeds', 'brand_group.rb')) do |file|
  load(file)
end
Dir.glob(File.join(Rails.root, 'db', 'seeds', 'user_deliver_address.rb')) do |file|
  load(file)
end
Dir.glob(File.join(Rails.root, 'db', 'seeds', 'item.rb')) do |file|
  load(file)
end
