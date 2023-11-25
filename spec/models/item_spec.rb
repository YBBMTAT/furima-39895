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
    end
  end
end
