FactoryBot.define do
  factory :shipment_buy do

    address { '123-4567' }
    prefecture_id { Prefecture.where.not(name: '---').sample.id } #「---」でないカテゴリーからランダムに1つ選ぶ
    city {'東京都'}
    street_num {'練馬区0-1'}
    building {'ビルA-13'}
    phone {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"} #カードトークン

  end
end
