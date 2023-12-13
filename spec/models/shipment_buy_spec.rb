require 'rails_helper'

RSpec.describe ShipmentBuy, type: :model do
  describe '商品購入' do
    
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      buy = FactoryBot.create(:buy, user: user, item: item)
      @shipment_buy = FactoryBot.build(:shipment_buy, user_id: user.id, item_id: item.id)
    end

    context '購入できる場合' do
      it 'カードトークンと発送先情報が入力されている' do
      end

      it 'buildingは空でも購入できる' do
      end
    end

    context '購入できない場合' do
      it 'カード情報が空では購入できない' do
      end

      it 'カード有効期限が空では購入できない' do
      end

      it 'セキュリティコードが空では購入できない' do
      end

      it 'tokenが空では購入できない' do
      end

      it 'addressが空では購入できない'do
      end

      it 'addressが「3桁ハイフン4桁」の半角文字列のみの記入でないと購入できない'do
      end

      it 'prefectureを選択していないと購入できない' do
      end

      it 'cityが空だと購入できない'do
      end
      
      it 'street_numが空だと購入できない'do
      end

      it 'phoneが空だと購入できない'do
      end

      it 'phoneにハイフンが入ると購入できない'do
      end

      it 'phoneが11桁以上だと購入できない'do
      end

      it 'phoneが9桁以下だと購入できない'do
      end

      it 'userが紐付いていないと保存できないこと' do
      end

      it 'buy_idが紐付いていないと保存できないこと' do
      end
    end
  end
end
