require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item) # itemのインスタンス生成
  end

  describe '出品' do
    context '出品できるとき' do
      it '商品画像、商品名、商品説明、カテゴリー、状態、送料、地域、発送日、価格が入力されている'do
        expect(@item).to be_valid
      end
    end

    context '出品出来ないとき' do
      it '商品画像が無ければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end

      it '商品名が無ければ出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品名は40文字まででないと出品できない' do
        @item.item_name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名は40文字以内で入力してください")
      end

      it '商品説明が無ければ出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it '商品説明が1000文字まででなければ出品できない' do
        @item.description = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明は1000文字以内で入力してください")
      end

      it '商品カテゴリーが「---」では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it '商品状態が「---」では出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品状態を選択してください")
      end

      it '配送料が「---」では出品できない' do
        @item.postage_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end

      it '発送元地域が「---」では出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end

      it '発送日が「---」では出品できない' do
        @item.leadtime_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      it '価格が無ければ出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格を入力してください")
      end

      it '価格が300円未満では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格は300以上の値にしてください")
      end

      it '価格が10,000,000円以上では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格は9999999以下の値にしてください")
      end

      it '価格に数字以外が入力されていると出品できない' do
        @item.price = '20,000'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格は数値で入力してください")
      end

      it '価格は整数でなければ出品できない' do
        @item.price = '500.5'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格は整数で入力してください")
      end

      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end

    end
  end
end
