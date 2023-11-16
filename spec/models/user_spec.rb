require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user) # Userのインスタンス生成
  end

  describe 'ユーザー管理機能' do

   describe '新規ユーザー登録' do

    it 'nicknameが空では登録できない' do
      @user.nickname = ''  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空では登録できない' do
      @user.email = ''  # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    
    it '同じ(既に登録済み)emailは登録できない'
    end

    it '@が含まれないemailは登録出来ない'
    end

    it 'パスワードが空では登録できない'
    end

    it 'パスワードが6文字以下では登録できない'
    end

    it 'パスワードが半角英数字を含まなければ登録できない'
    end

    it '確認パスワードが一致しなければ登録できない'
    end

   end
   
  end

end
