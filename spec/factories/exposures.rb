# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :exposure do
    summary "MyString"
    published "MyString"
    cvss_severity "MyString, not sting"
    title "MyString"
    cvss_v2_base_score 1
    impact_subscore 1
    exploitability_subscore 1
    access_vector "MyString"
    access_complexity "MyString"
    authentication "MyString"
  end
end
