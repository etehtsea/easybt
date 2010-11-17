# This will guess the User class
Factory.define :user do |u|
  u.email 'user@user.com'
  u.username 'user'
  u.admin false
end

# This will use the User class (Admin would have been guessed)
Factory.define :admin, :class => User do |u|
  u.email 'admin@admin.com'
  u.username 'admin'
  u.admin true
end