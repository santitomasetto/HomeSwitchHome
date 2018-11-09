# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "crear residencias"
Residencia.destroy_all
delsol=Residencia.find_or_create_by(nombre:"Del Sol",pais:"Miami",direccion:"NE 2nd avenue",capacidad:5,foto:"http://4.bp.blogspot.com/-rxXVVz7Xwp0/VbbPhYElqBI/AAAAAAAACbo/eeQsjViWSNE/s1600/tiempos%2Bcompartidos.jpg")
losmanzanos=Residencia.find_or_create_by(nombre:"Los Manzanos",pais:"Argentina",direccion:"Rivadavia 249",capacidad:3,foto:"https://static1.sosiva451.com/5056594/7cfb2a6d-33e2-442e-afcd-6e3c7eaecc8f_u_medium.jpg")