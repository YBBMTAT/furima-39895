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
        expect(@shipment_buy).to be_valid
      end

      it 'buildingは空でも購入できる' do
        @shipment_buy.building = nil
        expect(@shipment_buy).to be_valid
      end
    end

    context '購入できない場合' do

      it 'tokenが空では購入できない' do
        @shipment_buy.token = nil
        @shipment_buy.valid?
        expect(@shipment_buy.errors.full_messages).to include("Token can't be blank")
      end

      it 'addressが空では購入できない'do
        @shipment_buy.address = nil
        @shipment_buy.valid?
        expect(@shipment_buy.errors.full_messages).to include("Address can't be blank")
      end

      it 'addressが「3桁ハイフン4桁」の半角文字列の記入でないと購入できない'do
        @shipment_buy.address = '1231234'
        @shipment_buy.valid?
        expect(@shipment_buy.errors.full_messages).to include("Address is invalid")
      end

      it 'prefectureを選択していないと購入できない' do
        @shipment_buy.prefecture_id = '1'
        @shipment_buy.valid?
        expect(@shipment_buy.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと購入できない'do
       @shipment_buy.city = ''
       @shipment_buy.valid?
       expect(@shipment_buy.errors.full_messages).to include("City can't be blank")
      end
      
      it 'street_numが空だと購入できない'do
        @shipment_buy.street_num = ''
        @shipment_buy.valid?
        expect(@shipment_buy.errors.full_messages).to include("Street num can't be blank")
      end

      it 'phoneが空だと購入できない'do
        @shipment_buy.phone = ''
        @shipment_buy.valid?
        expect(@shipment_buy.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneにハイフンが入ると購入できない'do
        @shipment_buy.phone = '090-123-456'
        @shipment_buy.valid?
        expect(@shipment_buy.errors.full_messages).to include("Phone is not a number")
      end

      it 'phoneが11桁以内で無いと購入できない'do
      @shipment_buy.phone = '123456789012'
      @shipment_buy.valid?
      expect(@shipment_buy.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end

      it 'phoneが9桁以下だと購入できない'do
        @shipment_buy.phone = '12345678'
        @shipment_buy.valid?
        expect(@shipment_buy.errors.full_messages).to include("Phone is too short (minimum is 10 characters)")
      end

      it 'userが紐付いていないと保存できないこと' do
        @shipment_buy.user_id = nil
        @shipment_buy.valid?
        expect(@shipment_buy.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが紐付いていないと保存できないこと' do
        @shipment_buy.item_id = nil
        @shipment_buy.valid?
        expect(@shipment_buy.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
