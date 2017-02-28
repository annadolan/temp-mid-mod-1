FactoryGirl.define do
  factory :read do
    sequence :url do |n|
      "http://www.example.com#{n}"
    end
  end
end
