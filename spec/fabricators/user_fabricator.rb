Fabricator(:user) do
  email    { Faker::Internet.email }
  password { '123123' }
end
