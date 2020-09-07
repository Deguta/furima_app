require 'rails_helper'

describe ShippingInfo do
  describe '#create' do

    # 入力されている場合のテスト ▼

    it "全ての項目の入力が存在すれば登録できること" do
      shipping_info = build(:shipping_info)
      expect(shipping_info).to be_valid
    end

    # nul:false, presence: true のテスト ▼

    it "family_nameがない場合は登録できないこと" do
      shipping_info = build(:shipping_info, family_name: nil)
      shipping_info.valid?
      expect(shipping_info.errors[:family_name]).to include("を入力してください")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      shipping_info = build(:shipping_info, family_name_kana: nil)
      shipping_info.valid?
      expect(shipping_info.errors[:family_name_kana]).to include("を入力してください")
    end

    it "first_nameがない場合は登録できないこと" do
      shipping_info = build(:shipping_info, first_name: nil)
      shipping_info.valid?
      expect(shipping_info.errors[:first_name]).to include("を入力してください")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      shipping_info = build(:shipping_info, first_name_kana: nil)
      shipping_info.valid?
      expect(shipping_info.errors[:first_name_kana]).to include("を入力してください")
    end

    it "postal_codeがない場合は登録できないこと" do
      shipping_info = build(:shipping_info, postal_code: nil)
      shipping_info.valid?
      expect(shipping_info.errors[:postal_code]).to include("を入力してください")
    end

    it "prefecture_idがない場合は登録できないこと" do
      shipping_info = build(:shipping_info, prefecture_id: nil)
      shipping_info.valid?
      expect(shipping_info.errors[:prefecture]).to include("を入力してください")
    end

    
    it "cityがない場合は登録できないこと" do
      shipping_info = build(:shipping_info, city: nil)
      shipping_info.valid?
      expect(shipping_info.errors[:city]).to include("を入力してください")
    end
    
    it "addressがない場合は登録できないこと" do
      shipping_info = build(:shipping_info, address: nil)
      shipping_info.valid?
      expect(shipping_info.errors[:address]).to include("を入力してください")
    end

    # 名前全角入力のテスト ▼

    it 'family_nameが全角入力でなければ登録できないこと' do
      shipping_info = build(:shipping_info, family_name: "ｱｲｳｴｵ")
      shipping_info.valid?
      expect(shipping_info.errors[:family_name]).to include("は不正な値です")
    end

    it 'first_nameが全角入力でなければ登録できないこと' do
      shipping_info = build(:shipping_info, first_name: "ｱｲｳｴｵ")
      shipping_info.valid?
      expect(shipping_info.errors[:first_name]).to include("は不正な値です")
    end

    # フリガナ全角入力のテスト ▼

    it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
      shipping_info = build(:shipping_info, family_name_kana: "あいうえお")
      shipping_info.valid?
      expect(shipping_info.errors[:family_name_kana]).to include("は不正な値です")
    end
    
    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      shipping_info = build(:shipping_info, first_name_kana: "あいうえお")
      shipping_info.valid?
      expect(shipping_info.errors[:first_name_kana]).to include("は不正な値です")
    end

    # 任意入力のテスト ▼

    it "buildingが存在しなくても登録できること" do
      shipping_info = build(:shipping_info, building: nil)
      expect(shipping_info).to be_valid
    end

    it "phone_numberが存在しなくても登録できること" do
      shipping_info = build(:shipping_info, phone_number: nil)
      expect(shipping_info).to be_valid
    end
  end
end