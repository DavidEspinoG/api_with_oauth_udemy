FactoryBot.define do 
  sequence :slug do |n| 
    "title#{n}-example"
  end
end