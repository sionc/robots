Factory.define :user do |user|
  user.name                  "Test Tester"
  user.email                 "test@test.com"
  user.password              "testme"
  user.password_confirmation "testme"
end

Factory.define :robot do |robot|
  robot.name                  "Test Robot"
  robot.user_id               1
end