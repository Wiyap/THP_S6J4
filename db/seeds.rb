User.destroy_all
User.reset_pk_sequence

City.destroy_all
City.reset_pk_sequence

Gossip.destroy_all
Gossip.reset_pk_sequence

Tag.destroy_all
Tag.reset_pk_sequence

PrivateMessage.destroy_all
PrivateMessage.reset_pk_sequence

JoinGossipTag.destroy_all
JoinGossipTag.reset_pk_sequence

tags = ["Oh lala!","Non mais allo?!","Woops...","Sérieux?!","Chhhhhhut","Potin de bas étages","Couverture de Voici","Je sais plus quoi mettre","Et un tag de plus"]

10.times do |i|
  a_city = City.create(name:Faker::Address.city, zip_code:Faker::Address.zip_code)
  puts "#{i+1} City créé"
end

10.times do |i|
  a_user = User.create(first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, description:Faker::Lorem.sentence(word_count: 100), age:rand(13..70), email:Faker::Internet.email, city_id:rand(1..10), password: "123456789")
  puts "#{i+1} User créé"
end

20.times do |i|
  a_gossip = Gossip.create(title:Faker::Lorem.sentence(word_count: 3),content:Faker::Lorem.sentence(word_count: 100), user_id:rand(1..10))
  puts "#{i+1} Gossip créé"
end

tags.each do |tag|
  a_tag = Tag.create(title: tag)
end

10.times do |i|
  a_join = JoinGossipTag.create(tag_id:rand(1..10),gossip_id:rand(1..10))
end

# 10.times do |i|
#   a_mp = PrivateMessage.create(content:Faker::Lorem.sentence(word_count: 2),recipient_id:rand(1..10),sender_id:rand(1..10))
#   puts "#{i+1} PM créé"
# end