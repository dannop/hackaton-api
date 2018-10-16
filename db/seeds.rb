# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


20.times do |index|
    User.create(
        first_name: Faker::Name.name,
        last_name: Faker::Name.last_name,
        email: "email#{index}@email.com",
        level: rand(1 .. 100)
    )
end   

20.times do |index|
    Category.create(
        name: Faker::LeagueOfLegends.rank 
    )
end   

20.times do |index|
    Topic.create(
        title: Faker::RuPaul.queen,
        content: Faker::OnePiece.quote,
        category_id: rand(1..19),
        user_id: rand(1..19)
    )
end  

20.times do |index|
    Achievment.create(
        name: Faker::TheFreshPrinceOfBelAir.character,
        description: Faker::TheFreshPrinceOfBelAir.quote
    )
end  

