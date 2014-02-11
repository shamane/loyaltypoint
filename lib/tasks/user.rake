namespace :user do
  desc 'create user'
  task create: :environment do
    user = User.new(
      email: 'admin@example.com',
      password: '12345678',
      password_confirmation: '12345678'
      )
    user.save!
  end
end

