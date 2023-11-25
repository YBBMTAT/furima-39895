FactoryBot.define do
  factory :item do
    image { Rack::Test::UploadedFile.new(Rails.root.join('test', 'test.png'), 'image/png') }
    item_name {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    category_id { Category.where.not(name: '---').sample.id } #「---」でないカテゴリーからランダムに1つ選ぶ
    condition_id { Condition.where.not(name: '---').sample.id }
    postage_id { Postage.where.not(name: '---').sample.id }
    prefecture_id { Prefecture.where.not(name: '---').sample.id }
    leadtime_id { Leadtime.where.not(name: '---').sample.id }
    price { rand(300..9999999) } #300~9,999,999の整数をランダム生成
    association :user
  end
end
