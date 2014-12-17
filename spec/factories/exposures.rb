FactoryGirl.define do
  factory :exposure do
    summary                "MyString"
    published              "MyString"
    title                  "MyString"
    cvss_v2_base_score     1
    access_vector          "MyString"
    access_complexity      "MyString"
    authentication         "MyString"
    integrity_impact       "Bar"
    availablility_impact   "Foo"
    confidentiality_impact "foo"
    sequence(:cve_id){|n| "cve-id-#{n}"}
  end

  trait :ruby do 
    ruby true
  end
end
