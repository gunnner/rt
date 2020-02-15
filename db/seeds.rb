User.destroy_all
Album.destroy_all
Photo.destroy_all

User.create(
  first_name: 'Admin',
  last_name: 'Admin',
  username: 'Admin',
  email: 'admin@example.com',
  password: 'password'
)
