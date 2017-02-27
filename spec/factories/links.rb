FactoryGirl.define do
  factory :link do
    url "http://www.example.com"
    title "MyString"
    read false
    user
  end
end
