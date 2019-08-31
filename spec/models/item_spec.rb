require 'rails_helper'
describe Item do
  describe '#create' do
    it "名前が無いとだめ" do
      item = Item.new(name: "あああ", text: "ok", price: "1000", condition: "good")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
  end
end