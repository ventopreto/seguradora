# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or create! alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create![{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!name: 'Luke', movie: movies.first)

Insured.create!(name: "Mad Max", cpf: "96151218000")
Policy.create!(start_date: 1974, end_date: 2030, insured_id: Insured.find_by(cpf: "96151218000").id)
Vehicle.create!(brand: "Ford", model: "Falcon GT", year: 1973,
  registration_plate: "Interceptor-v6", policy_id: Policy.last.id)

Insured.create!(name: "Marty McFly", cpf: "12345678901")
Policy.create!(start_date: 1981, end_date: 2030, insured_id: Insured.find_by(cpf: "12345678901").id)
Vehicle.create!(brand: "DeLorean", model: "DMC-12", year: 1981, registration_plate: "OUTATIME",
  policy_id: Policy.last.id)

Insured.create!(name: "Bo Duke", cpf: "23456789012")
Policy.create!(start_date: 1969, end_date: 2030, insured_id: Insured.find_by(cpf: "23456789012").id)
Vehicle.create!(brand: "Dodge", model: "Charger", year: 1969, registration_plate: "General Lee",
  policy_id: Policy.last.id)

Insured.create!(name: "Fred Jones", cpf: "34567890123")
Policy.create!(start_date: 1978, end_date: 2030, insured_id: Insured.find_by(cpf: "34567890123").id)
Vehicle.create!(brand: "Ford", model: "Econoline", year: 1978,
  registration_plate: "Mystery Machine", policy_id: Policy.last.id)

Insured.create!(name: "Sam Witwicky", cpf: "45678901234")
Policy.create!(start_date: 1977, end_date: 2030, insured_id: Insured.find_by(cpf: "45678901234").id)
Vehicle.create!(brand: "Chevrolet", model: "Camaro", year: 1977, registration_plate: "BEE",
  policy_id: Policy.last.id)
