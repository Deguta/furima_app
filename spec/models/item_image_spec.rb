require 'rails_helper'

RSpec.describe ItemImage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

    describe ItemImage do
      describe '#create' do

      it "画像を投稿すれば登録できること" do
        item_image = FactoryBot.build(:item_image)
        expect(item_image).to be_valid
      end

      it "画像がなければ登録できないこと" do
        item_image = build(:item_image, image: nil)
        item_image.valid?
        expect(item_image.errors[:image]).to include("を入力してください")
      end
    end
  end
end
