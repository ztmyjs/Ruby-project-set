# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.new(
  email: 'admin@admin.com', 
  password: 'password', 
  password_confirmation: 'password',
  admin: true
)
admin.save!

user1 = User.new(
  email: 'user1@email.com', 
  password: 'password', 
  password_confirmation: 'password'
)

user1.save!

user2 = User.new(
  email: 'user2@email.com', 
  password: 'password', 
  password_confirmation: 'password'
)

user2.save!

user3 = User.new(
  email: 'user3@email.com', 
  password: 'password', 
  password_confirmation: 'password'
)

user3.save!

user4 = User.new(
  email: 'user4@email.com', 
  password: 'password', 
  password_confirmation: 'password'
)

user4.save!

user5 = User.new(
  email: 'user5@email.com', 
  password: 'password', 
  password_confirmation: 'password'
)

user5.save!

user6 = User.new(
  email: 'user6@email.com', 
  password: 'password', 
  password_confirmation: 'password'
)

user6.save!

user7 = User.new(
  email: 'user7@email.com', 
  password: 'password', 
  password_confirmation: 'password'
)

user7.save!

user8 = User.new(
  email: 'user8@email.com', 
  password: 'password', 
  password_confirmation: 'password'
)

user8.save!

team1 = Team.find_or_create_by(name: "JavaScript 2")
team2 = Team.find_or_create_by(name: "HTML/CSS 4")
team3 = Team.find_or_create_by(name: "Ruby 3")

TeamMember.find_or_create_by(user_id: user1.id, team_id: team1.id)
TeamMember.find_or_create_by(user_id: user2.id, team_id: team1.id)
TeamMember.find_or_create_by(user_id: user3.id, team_id: team1.id)
TeamMember.find_or_create_by(user_id: user4.id, team_id: team2.id)
TeamMember.find_or_create_by(user_id: user5.id, team_id: team2.id)
TeamMember.find_or_create_by(user_id: user6.id, team_id: team2.id)
TeamMember.find_or_create_by(user_id: user7.id, team_id: team3.id)
TeamMember.find_or_create_by(user_id: user8.id, team_id: team3.id)
TeamMember.find_or_create_by(user_id: user1.id, team_id: team3.id)

p1 = Presentation.find_or_create_by(name: "P5.js", team_id: team1.id)
p2 = Presentation.find_or_create_by(name: "Devise", team_id: team2.id)
p3 = Presentation.find_or_create_by(name: "Nokogiri", team_id: team3.id)
p4 = Presentation.find_or_create_by(name: "Final Project", team_id: team1.id)

Survey.find_or_create_by(presentation_id: p1.id, user_id: user4.id, overall: "GOOD")
Survey.find_or_create_by(presentation_id: p1.id, user_id: user5.id, overall: "POOR")
Survey.find_or_create_by(presentation_id: p2.id, user_id: user2.id, overall: "GREAT")
Survey.find_or_create_by(presentation_id: p2.id, user_id: user3.id, overall: "OK")
Survey.find_or_create_by(presentation_id: p3.id, user_id: user1.id, overall: "GOOD")
Survey.find_or_create_by(presentation_id: p3.id, user_id: user2.id, overall: "POOR")
Survey.find_or_create_by(presentation_id: p4.id, user_id: user6.id, overall: "GREAT")
Survey.find_or_create_by(presentation_id: p4.id, user_id: user7.id, overall: "GOOD")



