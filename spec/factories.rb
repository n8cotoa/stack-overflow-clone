FactoryBot.define do
  factory(:user) do
    name('Test Username')
    email('Test@test.com')
    password('Password123')
  end
end
