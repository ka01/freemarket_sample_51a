class Brand < ApplicationRecord
  has_many :items
  belongs_to :brand_group
  def self.initial_sort(brands)
    nums = []
    strings = []
    brands.each do |brand|
      if brand.name.match(/^\d/)
        nums.push(brand)
      else
        strings.push(brand)
      end
    end
    nums.sort_by{|num| num.name}
    strings.sort_by{|string| string.name}
    initials = strings.push(nums).flatten!
    initials.inject([]){|result,n| result << n.name[0] unless result.include?(n.name[0]);result}
  end
end
