# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cfe, :class => 'Cve' do
    summary "MyString"
    published "MyString"
    cvss_severity 1
    title "MyString"
    cvss_v2_base_scroe 1
    impact_subscore 1
    exploitability_subscore 1
    access_vector "MyString"
    access_complexity "MyString"
    authentication "MyString"
    impact_type "MyString"
    web_link "MyString"
    external_source_org "MyString"
    external_source_name "MyString"
    external_source_link "MyString"
  end
end
