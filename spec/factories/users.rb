FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname      { Faker::Name.initials(number: 2) }
    email         { Faker::Internet.free_email }
    password      { '1q1q1q1q' }
    password_confirmation { password }
    first_name    { person.first.kanji }
    last_name     { person.last.kanji }
    first_name_kana    { person.first.katakana }
    last_name_kana     { person.last.katakana }
    birthday           { Faker::Date.between(from: '1930-01-01', to: '2000-01-01') }
  end
end
