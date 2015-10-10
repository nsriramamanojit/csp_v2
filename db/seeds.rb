# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
############# Roles ###############
Role.create(:name => "super", :reference_code => "su", :description => "Super Admin", :created_at => Time.now, :created_by => 1)
Role.create(:name => "admin", :reference_code => "ad", :description => "Admin", :created_at => Time.now, :created_by => 1)
Role.create(:name => "manager", :reference_code => "ma", :description => "Manager", :created_at => Time.now, :created_by => 1)
#####
session = User.create do |u|
  u.name = 'Chaitanya Ram N'
  u.email = 'chaitanya@vedavaag.com'
  u.password = u.password_confirmation='admin123'
  u.mobile=9949033124
  Assignment.create(:user_id => 1, :role_id => 1, :created_at => Time.now, :updated_at => Time.now)
end
session.save

