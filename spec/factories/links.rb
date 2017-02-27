FactoryGirl.define do
  factory :link do
    sequence :url do |n|
      "http://www.example.com#{n}"
    end
    title "MyString"
    read false
    user
  end
end
