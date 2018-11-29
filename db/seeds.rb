# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
batman = User.create(email: "batman@gotham.com", username: "batman", password: "password", password_confirmation: "password")
robin = User.create(email: "robin@gotham.com", username: "robin", password: "password", password_confirmation: "password")
batgirl = User.create(email: "batgirl@gotham.com", username: "batgirl", password: "password", password_confirmation: "password")
superman = User.create(email: "superman@metropolis.com", username: "superman", password: "password", password_confirmation: "password")
AdminUser.create(email: "alfred@gotham.com", password: "password", password_confirmation: "password")

# started duel
Duel.create(player_one_id: batman.id, player_two_id: batgirl.id, starting_lp: 8000)
Duel.create(player_one_id: batman.id, player_two_id: robin.id, starting_lp: 8000)
Duel.create(player_one_id: superman.id, player_two_id: batman.id, starting_lp: 8000)
# completed duel
Duel.create(player_one_id: batman.id, player_two_id: robin.id, status: 1, ended_at: Time.now, starting_lp: 8000, player_one_lp: 8000, player_two_lp: 0)
Duel.create(player_one_id: batman.id, player_two_id: superman.id, status: 1, ended_at: Time.now, starting_lp: 8000, player_one_lp: 8000, player_two_lp: 0)
Duel.create(player_one_id: batgirl.id, player_two_id: batman.id, status: 1, ended_at: Time.now, starting_lp: 8000, player_one_lp: 8000, player_two_lp: 0)
# cancelled duel
Duel.create(player_one_id: batman.id, player_two_id: batgirl.id, starting_lp: 8000, status: 2)
Duel.create(player_one_id: batman.id, player_two_id: superman.id, starting_lp: 8000, status: 2)
Duel.create(player_one_id: robin.id, player_two_id: batman.id, starting_lp: 8000, status: 2)