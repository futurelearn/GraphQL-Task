# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

psych_courses = Course.create([{title: 'Forensic psychology'}, {title: 'Clinical psychology'}])
Course.create({title: 'Career development'})
big_discount = Discount.create(amount: 40)
small_discount = Discount.create(amount: 20)
Collection.create([
  {title: 'Psychology', courses: psych_courses},
  {title: 'Big discount', courses: [psych_courses.first], discount: big_discount},
  {title: 'Small discount', courses: psych_courses, discount: small_discount}
])
