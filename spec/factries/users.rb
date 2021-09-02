FactoryBot.define do
  factory :user do
    name { 'test' }
    email                 { 'test@example' }
    password              { '000000' }
    password_confirmation { password }
    profile { 'test' }
    country { '1' }
  end
end
