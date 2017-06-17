# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

av = EquipmentStatus.create! :name => "Available"
rs = EquipmentStatus.create! :name => "Reserved"
br = EquipmentStatus.create! :name => "Borrowed"
bk = EquipmentStatus.create! :name => "Defective"
ur = EquipmentStatus.create! :name => "Under repair"

c1 = Category.create! :name => "Messuring Technology"
c2 = Category.create! :name => "Electrical Engineering"
c3 = Category.create! :name => "Audio Technology"
c4 = Category.create! :name => "Video Technology"
c5 = Category.create! :name => "Software & Computer"
c6 = Category.create! :name => "Miscellaneous"




10.times do |available_item|
  Equipment.create!(
      name: "Equipment #{available_item}",
      description: "A cool equipment of my laboratory that is available for borrowing.",
      equipment_status: av,
      quantity: 1,
      main_image: "http://via.placeholder.com/600x400",
      thumb_image: "http://via.placeholder.com/300x200",
      inv_nr: rand(10000...100000),
      category_id: rand(1...6)
  )
end

puts "6 available equipment items created"

6.times do |reserved_item|
  Equipment.create!(
      name: "Equipment #{reserved_item}",
      description: "An equipment item that is still in the lab but already reserved for the choosen period of time. Only under special condition can the reservation be changed.",
      equipment_status: rs, quantity: 1,
      main_image: "http://via.placeholder.com/600x400",
      thumb_image: "http://via.placeholder.com/300x200",
      inv_nr: rand(10000...100000),
      category_id: rand(1...6)

  )
end
puts "6 reserved equipment items created"


6.times do |borrowed_item|
  Equipment.create!(
      name: "Equipment #{borrowed_item}",
      description: "An equipment item that is being borrowed and thus unavailable.",
      equipment_status: br, quantity: 1,
      main_image: "http://via.placeholder.com/600x400",
      thumb_image: "http://via.placeholder.com/300x200",
      inv_nr: rand(10000...100000),
      category_id: rand(1...6)

  )
end
puts "6 borrowed equipment items created"

3.times do |dreported_item|
  Equipment.create!(
      name: "Equipment #{dreported_item}",
      description: "An equipment item that is reported to be defective. Waiting for status confirmation from staff. Can be borrowed under consideration.",
      equipment_status: bk, quantity: 1,
      main_image: "http://via.placeholder.com/600x400",
      thumb_image: "http://via.placeholder.com/300x200",
      inv_nr: rand(10000...100000),
      category_id: rand(1...6)

  )
end
puts "3 defective equipment items created"


3.times do |urepair_item|
  Equipment.create!(
      name: "Equipment #{urepair_item}",
      description: "A defective equipment of my laboratory that is under repaired. Soon be available again.",
      equipment_status: ur,
      main_image: "http://via.placeholder.com/600x400",
      thumb_image: "http://via.placeholder.com/300x200",
      inv_nr: rand(10000...100000),
      category_id: rand(1...6)
  )
end
puts "3 under repair equipment items created"
