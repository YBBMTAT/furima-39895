FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.email}
    password              {'Abc123'}
    kanji_last_name       {'くボ田'}
    kanji_first_name      {'こウ太郎'}
    kana_last_name        {'クボタ'}
    kana_first_name       {'コウタロウ'}
    password_confirmation {password}
    birthday              {'1930-01-01'}
  end
end