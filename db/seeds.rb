# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# for i in 90000001..90000100 do
#   User.find_or_create_by!(phone_no: i)
# end


UserType.find_or_create_by!(user_type: 'admin')
UserType.find_or_create_by!(user_type: 'biz_user')
UserType.find_or_create_by!(user_type: 'store')
UserType.find_or_create_by!(user_type: 'member')

# for i in 1..20 do
#   registered_user = RegisteredUser.find_or_create_by!(email: 'biz' + i.to_s + '@email.com') do |registered_user|
#     registered_user.password = 'password'
#     registered_user.password_confirmation = 'password'
#     registered_user.user_type_id = 2
#   end
# end

# Create default admin user
registered_user = RegisteredUser.find_or_create_by!(email: 'admin@email.com') do |registered_user|
  registered_user.password = 'password'
  registered_user.password_confirmation = 'password'
  registered_user.user_type_id = 1
end
#
#
# for i in 1..20 do
#   biz_user = BizUser.find_or_create_by!(registered_user_id: i) do |biz_user|
#     biz_user.reg_no = 'biz' + i.to_s
#     biz_user.company_name = 'Company ' + i.to_s + ' Pte Ltd'
#     biz_user.address = i.to_s + ' Street Singapore ' + i.to_s
#     biz_user.contact_no = 80000000 + i
#     biz_user.contact_person = 'owner' + i.to_s
#   end
# end
#
# for i in 1..20 do
#   for j in 1..rand(1..10) do
#     registered_user = RegisteredUser.find_or_create_by!(email: 'store' + j.to_s + '@biz' + i.to_s + '.com') do |registered_user|
#       registered_user.password = 'password'
#       registered_user.password_confirmation = 'password'
#       registered_user.user_type_id = 3
#     end
#     store = Store.find_or_create_by!(registered_user_id: registered_user.id) do |store|
#       store.store_name = 'Store ' + j.to_s
#       store.store_address = i.to_s + j.to_s + ' Lane Singapore 123456'
#       store.contact_no = 81000000 + (i*1000) + j
#       store.contact_person = 'Manager' + i.to_s + j.to_s
#       store.biz_user_id = i
#       store.max_queue_no = 99
#       store.max_queue_allow = 9999
#       store.reservation_fee = 0.00
#       store.max_leeway = 3
#       store.store_picture = 'http://res.cloudinary.com/phuaky/image/upload/v1476168520/yyuoiwxc2qs47tpedltj.jpg'
#     end
#   end
# end

Status.find_or_create_by!(status_type: 'waiting')
Status.find_or_create_by!(status_type: 'late')
Status.find_or_create_by!(status_type: 'no show')
Status.find_or_create_by!(status_type: 'served')
Status.find_or_create_by!(status_type: 'user cancel')
Status.find_or_create_by!(status_type: 'incorrect entry')
# 
# no_of_stores = Store.all.count
# no_of_users = User.all.count
#
# for i in 1..no_of_stores do
#   j = rand(1..30)
#   k = 1
#   while j < no_of_users
#     customer = Customer.find_or_create_by!(user_id: j, store_id: i, queue_no: k, status_id: 1)
#     j += rand(1..30)
#     k += 1
#   end
# end
