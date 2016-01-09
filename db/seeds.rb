users = User.all
photos = Photo.all
rating = ["thumbs up", "thumbs down", "meh"]
20.times do
  Review.create(
    comment: Faker::Hacker.say_something_smart,
    user_id: users.sample.id,
    photo_id: photos.sample.id,
    rating: rating.sample
  )
end
