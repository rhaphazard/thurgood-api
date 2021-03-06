FactoryGirl.define do

  factory :server do
    sequence(:name) { |n| "server#{n}" }
    instance_url 'https://login.salesforce.com'
    password 'password1'
    platform 'salesforce.com'
    repo_name 'server1'
    status 'available'
    languages 'apex'
    username 'server1'
  end

  factory :api_key do
    description 'testing'
  end

  factory :logger_account do
    name 'test-rails1'
    email 'test-rails@cloudspokes.com'

    factory :account_with_unique_email do
      email "test-rails#{Random.rand(100)}@cloudspokes.com"
    end

    factory :logger_account_jeffdonthemic do
      email "jeff@cloudspokes.com"
      name 'jeffdonthemic'
      papertrail_id 'jeffdonthemic'
    end

    factory :logger_account_jeffdonthemictest1 do
      email "jeffdonthemictest1@cloudspokes.com"
      name 'jeffdonthemictest1'
      papertrail_id 'jeffdonthemictest1'
    end    

  end

  factory :logger_system do
    name 'system1'
    papertrail_id 'testsystem1'
    logger_account
  end 

  factory :job do
    user_id 'jeffdonthemic'
    email 'jeff@cloudspokes.com'
    language 'apex'
    platform 'salesforce.com'
    job_id '123456abcd'
    code_url 'http://www.cloudspokes.com/some-file.zip'

    factory :job_jeffdonthemictest1 do
      user_id 'jeffdonthemictest1'
      email 'jeffdonthemictest1@cloudspokes.com'
      job_id '111111111'
    end

  end 

end