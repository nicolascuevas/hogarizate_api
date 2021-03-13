FactoryBot.define do
  factory :monthly_income do
    contact_form { nil }
    year { "" }
    month { "" }
    date { "2021-03-13" }
    total { "" }
    main { "" }
    extra { "" }
  end
end
