require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー管理機能' do

   it 'nicknameが空では登録できない'do
    user = User.new(nickname:'', email: 'test@example.jp', password: 'a00000', password_confirmation: 'a00000')
    user.valid?
    expect(user.errors.full_messages).to include("Nickname can't be blank")
   end

   it 'emailが空では登録できない'do
    user = User.new(nickname:'test', email: '', password: 'a00000', password_confirmation: 'a00000')
    user.valid?
    expect(user.errors.full_messages).to include("Email can't be blank")
   end
  end

end
