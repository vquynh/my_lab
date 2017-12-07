# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Project.create(name: 'Choose Project')

puts "created placeholder project"

BookingStatus.create(name: 'Submitted')
BookingStatus.create(name: 'Confirmed')
BookingStatus.create(name: 'Unclaimed')
BookingStatus.create(name: 'Claimed')
BookingStatus.create(name: 'Overdue')
BookingStatus.create(name: 'Returned')

puts "created booking statuses"

av = EquipmentStatus.create! :name => "Available"
rs = EquipmentStatus.create! :name => "Reserved"
br = EquipmentStatus.create! :name => "Borrowed"
bk = EquipmentStatus.create! :name => "Defective"
ur = EquipmentStatus.create! :name => "Under repair"

puts "created equipment statuses"

Category.create! :name => "Measuring Technology"
Category.create! :name => "Electrical Engineering"
Category.create! :name => "Audio Technology"
Category.create! :name => "Video Technology"
Category.create! :name => "Software & Computer"
Category.create! :name => "Miscellaneous"

puts "created equipment categories"

10.times do |project_item|
  Project.create!(
      name: "Project #{project_item}",
      description: "An interesting project that students can take part in. The necessary equipment for the project can be found in the laboratory's database.",
      main_image: "http://via.placeholder.com/600x400",
      thumb_image: "http://via.placeholder.com/300x200",
  )
end

puts "10 projects created"

5.times do |et_item|
  Equipment.create!(
      name: "Equipment #{et_item}",
      description: "Measuring equipment from my laboratory that is available for borrowing.",
      equipment_status: av,
      quantity: 1,
      main_image: "http://via.placeholder.com/600x400",
      thumb_image: "http://via.placeholder.com/300x200",
      inv_nr: rand(10000...100000).to_s,
      category_id: 1
  )
end
puts "10 available equipment items created"


9.times do |me_item|
  Equipment.create!(
      name: "Equipment #{me_item}",
      description: "Electronic equipment from my laboratory that is available for borrowing.",
      equipment_status: av,
      quantity: 1,
      main_image: "http://via.placeholder.com/600x400",
      thumb_image: "http://via.placeholder.com/300x200",
      inv_nr: rand(10000...100000).to_s,
      category_id: 2
  )
end
puts "9 available equipment items created"

8.times do |au_item|
  Equipment.create!(
      name: "Equipment #{au_item}",
      description: "Audio equipment from my laboratory that is available for borrowing.",
      equipment_status: av,
      quantity: 1,
      main_image: "http://via.placeholder.com/600x400",
      thumb_image: "http://via.placeholder.com/300x200",
      inv_nr: rand(10000...100000).to_s,
      category_id: 3
  )
end
puts "8 available equipment items created"

7.times do |vi_item|
  Equipment.create!(
      name: "Equipment #{vi_item}",
      description: "Video equipment from my laboratory that is available for borrowing.",
      equipment_status: av,
      quantity: 1,
      main_image: "http://via.placeholder.com/600x400",
      thumb_image: "http://via.placeholder.com/300x200",
      inv_nr: rand(10000...100000).to_s,
      category_id: 4
  )
end
puts "8 video equipment items created"

6.times do |pc_item|
  Equipment.create!(
      name: "Equipment #{pc_item}",
      description: "Computer and software equipment from my laboratory that is available for borrowing.",
      equipment_status: av,
      quantity: 1,
      main_image: "http://via.placeholder.com/600x400",
      thumb_image: "http://via.placeholder.com/300x200",
      inv_nr: rand(10000...100000).to_s,
      category_id: 5
  )
end
puts "6 video equipment items created"

5.times do |m_item|
  Equipment.create!(
      name: "Equipment #{m_item}",
      description: "Cool equipment from my laboratory that is available for borrowing.",
      equipment_status: av,
      quantity: 1,
      main_image: "http://via.placeholder.com/600x400",
      thumb_image: "http://via.placeholder.com/300x200",
      inv_nr: rand(10000...100000).to_s,
      category_id: 6
  )
end
puts "6 video equipment items created"