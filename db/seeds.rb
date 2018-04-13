require 'faker'

if Rails.env.development?
  User.create!(
    email: 'admin@example.com',
    encrypted_password: 'password',
  )
end
