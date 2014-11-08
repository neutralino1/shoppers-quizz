# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

questions = JSON.parse(File.read(Rails.root.join('db','zquestions.json')))

questions.each do |name, pictures|
  p name
  Question.where(question: name).first_or_create.tap do |question|
    pictures.each_with_index do |url, idx|
      question.answers.where(url: url).first_or_create(correct: idx == 0)
    end
  end
end

User.first_or_create(email: 'arnaud@instacart.com')