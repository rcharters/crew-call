# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    position "MyString"
    rate 1
    start_date "2013-05-14"
    end_date "2013-05-14"
    is_avaliable false
  end
end
