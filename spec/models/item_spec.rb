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
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が無ければ出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品名は40文字まででないと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品説明が無ければ出品できない' do
      end

      it '商品説明が1000文字まででなければ出品できない' do
      end

      it '商品カテゴリーが「---」では出品できない' do
      end

      it '商品状態が「---」では出品できない' do
      end

      it '配送料が「---」では出品できない' do
      end

      it '発送元地域が「---」では出品できない' do
      end

      it '発送日が「---」では出品できない' do
      end

      it '価格が無ければ出品できない' do
      end

      it '価格が300円未満では出品できない' do
      end

      it '価格が10,000,000円以上では出品できない' do
      end

      it 'ユーザーが紐付いていなければ出品できない' do
      end

    end
  end
end
