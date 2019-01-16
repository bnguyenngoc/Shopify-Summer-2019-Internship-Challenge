# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create! [
    {title: 'Apple', price: '3.50', inventory_count: '25'},
    {title: 'Orange', price: '4.20', inventory_count: '42'},
    {title: 'Pineapple', price: '6.40'}
]

Company.create({name: 'The Company', money: 0})