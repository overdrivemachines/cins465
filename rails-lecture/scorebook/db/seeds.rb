# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
HighScore.create(user: "john", game: "mario", score: 36)
HighScore.create(user: "adam", game: "pacman", score: 58)
HighScore.create(user: "bryan", game: "pacman", score: 55)
HighScore.create(user: "spencer", game: "tetris", score: 98)