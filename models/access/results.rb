class Results < Sequel::Model($access_jenkins_connection['results'.to_sym])
  set_primary_key :scenario
end

FactoryBot.define do
  factory :results, class: Results do
  end
end