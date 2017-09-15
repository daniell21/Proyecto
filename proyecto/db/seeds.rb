# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Rate.create(name: 'monthlyPayment', amount: 0)
Rate.create(name: 'oldMonthlyPayment', amount: 0)
Rate.create(name: 'installPayment', amount: 0)
Rate.create(name: 'completePayment', amount: 0)
Rate.create(name: 'reactivationPayment', amount: 0)
Discount.create(name: 'Fidelidad', percentage: 0)
Discount.create(name: 'Volumen', percentage: 0)

