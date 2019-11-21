FactoryBot.define do
  factory :user do
    name { 'バリスタ' }
    sex { '男' }
    birthday { '1997-10-19' }
    email { 'barista@example.com' }
    password { 'password' }
  end
end