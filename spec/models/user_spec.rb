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
    
    it '同じ(既に登録済み)emailは登録できない' do
     @user.save
     another_user = FactoryBot.build(:user) #another_user生成
     another_user.email = @user.email #保存済みの@user.email
     another_user.valid?
     expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it '@が含まれないemailは登録出来ない' do
     @user.email = 'testmail' #@が無いアドレスに上書き
     @user.valid?
     expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが空では登録できない' do
     @user.password = ''# passwordの値を空にする
     @user.valid?
     expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードが6文字以下では登録できない' do
     @user.password = 'a1234' #半角英数字込みで6文字以下で上書き
     @user.password_confirmation = 'a1234'
     @user.valid?
     expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードが半角英数字でなければ登録できない' do
      @user.password = 'Ａ１２３４５' 
      @user.password_confirmation = 'Ａ１２３４５'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it '確認パスワードが不一致では登録できない' do
     @user.password = 'a12345'
     @user.password_confirmation = 'b12345'
     @user.valid?
     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

   end

  end

end
