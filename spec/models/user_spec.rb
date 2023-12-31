require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user) # Userのインスタンス生成
  end

  describe 'ユーザー管理機能' do

   describe '会員情報入力' do
    context '新規登録できるとき' do
      it 'nickname,email,名前(平仮名漢字),名前(カタカナ)password,誕生日が入力してあれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''  # nicknameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end

      it 'emailが空では登録できない' do
        @user.email = ''  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
      
      it '同じ(既に登録済み)emailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user) #another_user生成
        another_user.email = @user.email #保存済みの@user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it '@が含まれないemailは登録出来ない' do
        @user.email = 'testmail' #@が無いアドレスに上書き
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''# passwordの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
        end

      it 'パスワードが6文字以下では登録できない' do
        @user.password = 'a1234' #半角英数字込みで6文字以下で上書き
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'パスワードが全角だと登録できない' do
        @user.password = 'ａ１２３４５' 
        @user.password_confirmation = 'ａ１２３４５'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上の半角英数字で入力してください。")
      end

      it 'パスワードが全角数字のみだと登録できない' do
        @user.password = '１２３４５６' 
        @user.password_confirmation = '１２３４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上の半角英数字で入力してください。")
      end

      it 'パスワードが全角英語のみだと登録できない' do
        @user.password = ' ａｂｃｄｅｆ' 
        @user.password_confirmation = ' ａｂｃｄｅｆ'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上の半角英数字で入力してください。")
      end

      it 'パスワードに全角が入ってると登録できない' do
        @user.password = 'ａ12345' 
        @user.password_confirmation = 'ａ12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上の半角英数字で入力してください。")
      end

      it 'パスワードが半角数字だけでは登録できない' do
        @user.password = '123456' 
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上の半角英数字で入力してください。")
      end

      it 'パスワードが半角英語だけでは登録できない' do
        @user.password = 'abcdef' 
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上の半角英数字で入力してください。")
      end

      it '確認パスワードが不一致では登録できない' do
        @user.password = 'a12345'
        @user.password_confirmation = 'b12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it '名前(全角)は全角漢字平仮名でなければ登録出来ない' do
        @user.kanji_last_name = 'tanaka'
        @user.kanji_first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(全角)は全角漢字平仮名で入力してください。", "お名前(全角)は全角漢字平仮名で入力してください。")
      end

      it '名前(全角)名字が空では登録出来ない' do
        @user.kanji_last_name = ''  # 苗字値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(全角)を入力してください", "苗字(全角)は全角漢字平仮名で入力してください。")
      end

      it '名前(全角)は名前が空では登録出来ない' do
        @user.kanji_first_name = ''  # 名前値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)を入力してください", "お名前(全角)は全角漢字平仮名で入力してください。")
      end

      it '名前(ナカ)は名字が空では登録出来ない' do
        @user.kana_last_name = ''  # 苗字値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)を入力してください", "苗字(カナ)は全角カタカナで入力してください。")
      end

      it '名前(カナ)は名前が空では登録出来ない' do
        @user.kana_first_name = ''  # 名前値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(カナ)を入力してください", "お名前(カナ)は全角カタカナで入力してください。")
      end

      it '名前(カナ)は全角カタカナでなければ登録出来ない' do
        @user.kana_last_name = 'ﾀﾅｶ'
        @user.kana_first_name = 'ﾀﾛｳ'  #半角カタカナ入力
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)は全角カタカナで入力してください。", "お名前(カナ)は全角カタカナで入力してください。")
      end

      it '誕生日が空では登録出来ない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end

    end
   end
  end

end
