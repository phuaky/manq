# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
for i in 90000000..90000100 do
  User.find_or_create_by!(phone_no: i)
end

for i in 9..16 do
  Biz_user.find_or_create_by!(email: email_string) do |biz_user|

  end
end
