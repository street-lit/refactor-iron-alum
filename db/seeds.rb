# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
city = %w(Austin Dallas Houston)
course = %w(Frontend Backend Design)
bool = [true, false]


city.each do |n|
  location = Location.create({
    city: n,
    state: "TX"
    })
  course.each do |c|
    cohort = Cohort.create({
    location_id: location.id,
    course_name: c,
    start_date: "Mon, 24 Aug 2015",
    end_date: "Fri, 13 Nov 2015"
    })
    15.times do
      rand_num = Random.new
      Student.create({
      cohort_id: cohort.id,
      f_name: Faker::Name.first_name,
      l_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      bio: Faker::Lorem.paragraphs(rand_num.rand(1..3)).join(" "),
      linked_in: Faker::Internet.url('inlinked.com'),
      github: Faker::Internet.url('hubgit.com'),
      employed: bool.sample,
      place_employed: nil,
      location_id: location.id
      })
    end
  end
end



