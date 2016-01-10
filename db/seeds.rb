User.create(
  username: "tammy",
  email: "tamaramitryakova@yahoo.com",
  password: "go",
  password_confirmation: "go"
)

User.create(
  username: "marius",
  email: "example@example.com",
  password: "go",
  password_confirmation: "go"
)

User.create(
  username: "admin",
  email: "ex@example.com",
  password: "go",
  password_confirmation: "go"
)

users = User.all

# add photos manually

photos = Photo.all
rating = [1,0,-1]

20.times do
  Review.create(
    comment: Faker::Hacker.say_something_smart,
    user_id: users.sample.id,
    photo_id: photos.sample.id,
    rating: rating.sample
  )
end
