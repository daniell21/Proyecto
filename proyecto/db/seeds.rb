# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Rate.create(name: 'Mensualidad', amount: 0)
Rate.create(name: 'Instalación', amount: 0)
Rate.create(name: 'Pago COmpleto', amount: 0)
Rate.create(name: 'Reactivación', amount: 0)
Discount.create(name: 'Fidelidad', percentage: 0)
Discount.create(name: 'Volumen', percentage: 0)

