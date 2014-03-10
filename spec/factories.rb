require 'factory_girl'

FactoryGirl.define do
  factory :user do
    name "John"
    email "john@test.com"
    password "password"
  end
end