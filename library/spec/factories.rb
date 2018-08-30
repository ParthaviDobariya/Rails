FactoryBot.define do
  
  factory :author do
  	name       {"Dave"} 
  	birth_date {"2018-08-06"} 
  	email      {"dave@gmail.com"} 
  	website    {"www.dave.com"}
  end

  factory :book do
    title           {"abc"}
    isbn_no         {"1234567890012"}
    number_of_books {"100"}
    pages           {"200"}
    publish_date    {"2018-08-06"}
    publication
  end

  factory :publication do
    sequence(:name) { |n| "Name-#{n}" }
    address    {"katargam"} 
    website    {"www.surat1.com"}
  end

  factory :category do
    name       {"drama"} 
  end

  factory :shop do
    name       {"surat1"} 
    address    {"katargam"} 
    latitude   {"22"}
    longitude  {"22"}
  end

  factory :books_authors do
    book
    author
  end

  factory :books_categories do
    book
    category
  end

  factory :books_shops do
    book
    shop
  end
end