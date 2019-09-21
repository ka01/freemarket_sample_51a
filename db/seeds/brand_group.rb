require 'csv'
CSV.foreach('db/brand_group.csv') do |record|
  BrandGroup.create(name: record[0])
end

require 'csv'
CSV.foreach('db/brand.csv') do |record|
  Brand.create(name: record[0], brand_group_id: record[1])
end
