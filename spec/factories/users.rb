FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@test.jp'}
    password              {'a00000'}
    kanji_last_name       {'山田'}
    kanji_first_name      {'太郎'}
    kana_last_name        {'ヤマダ'}
    kana_first_name       {'タロウ'}
    password_confirmation {password}
    birthday              {'1930-01-01'}
  end
end