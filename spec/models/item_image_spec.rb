require 'rails_helper'

RSpec.describe ItemImage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

    describe ItemImage do
      describe '#create' do

      it "画像を投稿すれば登録できること" do
        item_image = FactoryBot.build(:item_image)
        expect(item_image).to be_valid
      end
    end
  end
end
