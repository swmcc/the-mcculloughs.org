# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: 'something@example.com', password: 'pass5577')

videos = Video.create([
  { name: 'Video 1', description: 'Description 1', date_of_recording: '1993-02-08'},
  { name: 'Video 2', description: 'Description 2', date_of_recording: '2008-11-15'},
  { name: 'Video 1', description: 'Description 1', date_of_recording: '2019-04-11'}
])

