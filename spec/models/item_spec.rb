require 'rails_helper'

describe Item do
  describe '#create' do

    # 入力されている場合のテスト ▼

    it "全ての項目の入力が存在すれば登録できること" do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item, user_id: user.id)
      expect(item).to be_valid
    end
    
    # nul:false,presence: trueのテスト ▼

    it "nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "descriptionがない場合は登録できないこと" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it "categoryがない場合は登録できないこと" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("を入力してください")
    end

    it "conditionがない場合は登録できないこと" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end

    it "shipping_costがない場合は登録できないこと" do
      item = build(:item, shipping_cost: nil)
      item.valid?
      expect(item.errors[:shipping_cost]).to include("を入力してください")
    end

    it "prefectureがない場合は登録できないこと" do
      item = build(:item, prefecture: nil)
      item.valid?
      expect(item.errors[:prefecture]).to include("を入力してください")
    end

    it "shipping_dayがない場合は登録できないこと" do
      item = build(:item, shipping_day: nil)
      item.valid?
      expect(item.errors[:shipping_day]).to include("を入力してください")
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end


    # price 300〜9999999のテスト ▼

    it "priceが300未満は登録できないこと" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("は300より大きい値にしてください")
    end

    it "priceが9999999を超過する場合は登録できないこと" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("は9999999より小さい値にしてください")
    end
    
  end
end