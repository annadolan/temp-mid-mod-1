FactoryGirl.define do
  factory :read_link do
    sequence :url do |n|
      "http://www.example.com#{n}"
    end
  end
end
