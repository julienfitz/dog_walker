# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

W_KEY_ARR =
  [:name, :phone, :email, :password, :walker]

WALKER_ARR = [
  ["Walker Texas Ranger", "555-WALK-DOG", "walker@walker.com", "password", 1 ],
  ["Bobbert Bobson", "555-WALK-BOB", "bob@bob.com", "password", 1 ],
  ["Cesar Millan", "555-WALK-DOG", "cesar@cesar.com", "password", 1 ],
  ["Wiggles Jigglemore", "555-WALK-DOG", "wiggles@wiggles.com", "password", 1 ],
  ["The Dude", "555-WALK-DOG", "dude@dude.com", "password", 1 ],
  ["Party Jones", "555-WALK-DOG", "party@party.com", "password", 1 ]
]

WALKER_ARR.each do |array|
  counter = 0
  w = User.create(
    W_KEY_ARR[counter]       => array[counter],
    W_KEY_ARR[counter += 1]  => array[counter],
    W_KEY_ARR[counter += 1]  => array[counter],
    W_KEY_ARR[counter += 1]  => array[counter],
    :password_confirmation => array[counter],
    W_KEY_ARR[counter += 1]  => array[counter],
      )
  w.avatar.store!(File.open(File.join(Rails.root, "public/seed-photos/" + array[0].downcase.gsub(" ", "_") + ".jpg")))
  w.save!
end

H_KEY_ARR =
  [:owner_name, :address, :phone, :email, :key_info, :walker_id]

HOUSE_ARR = [
  ["Oliver", "23 Home Street", "555-234-4567", "oliver@oliver.com", "under the mat", 1],
  ["Julie", "11 Bananagram Lane", "555-234-4567", "julie@julie.com", "with the doorman", 2],
  ["James", "333 Main Street", "555-234-4567", "james@james.com", "you have it", 3],
  ["Erica", "123 Fake Street", "555-234-4567", "erica@erica.com", "doesn't exist", 4],
  ["Jackie", "Five Park Avenue South", "555-234-4567", "jackie@jackie.com", "butler will let you in", 5]
]

HOUSE_ARR.each do |array|
  counter = 0
  h = Household.create(
   H_KEY_ARR[counter]       => array[counter],
   H_KEY_ARR[counter += 1]  => array[counter],
   H_KEY_ARR[counter += 1]  => array[counter],
   H_KEY_ARR[counter += 1]  => array[counter],
   H_KEY_ARR[counter += 1]  => array[counter],
   H_KEY_ARR[counter += 1]  => array[counter]
  )
  h.save!
end

P_KEY_ARR =
  [:name, :species, :size, :allergies, :age, :feeding, :household_id]

PET_ARR = [
  ["Adam Anteater", "other", "small", "nuts", "baby", "ants", 1],
  ["Cornelius", "other", "extra small", "sadness", "baby", "fruit", 1],
  ["Damascus", "cat", "small", "horses", "adult", "hay", 2],
  ["Fatty", "cat", "extra small", "nothing", "baby", "everything", 2],
  ["Fluffenstein", "dog", "small", "goodness", "baby", "souls", 3],
  ["Jabba", "cat", "extra large", "diets", "adult", "everything", 3],
  ["Mr Billingsworth", "dog", "small", "mediocrity", "older", "sensible meals", 4],
  ["Mr. Cat Esq", "cat", "small", "laughter", "young", "fresh salmon only", 4],
  ["Pickles", "dog", "small", "pickles", "baby", "baby food", 5],
]

PET_ARR.each do |array|
  counter = 0
  p = Pet.create(
    P_KEY_ARR[counter]       => array[counter],
    P_KEY_ARR[counter += 1]  => array[counter],
    P_KEY_ARR[counter += 1]  => array[counter],
    P_KEY_ARR[counter += 1]  => array[counter],
    P_KEY_ARR[counter += 1]  => array[counter],
    P_KEY_ARR[counter += 1]  => array[counter],
    P_KEY_ARR[counter += 1]  => array[counter],
      )
  p.avatar.store!(File.open(File.join(Rails.root, "public/seed-photos/" + array[0].downcase.gsub(" ", "_") + ".jpg")))
  p.save!
end

O_KEY_ARR =
  [:name, :email, :password, :walker]

OWNER_ARR = [
  ["Oliver", "oliver@oliver.com", "password", 0],
  ["Julie", "julie@julie.com", "password", 0],
  ["James", "james@james.com", "password", 0],
  ["Erica", "erica@erica.com", "password", 0],
  ["Jackie", "jackie@jackie.com", "password", 0]
]

OWNER_ARR.each do |array|
  counter = 0
  o = User.create(
    O_KEY_ARR[counter]       => array[counter],
    O_KEY_ARR[counter += 1]  => array[counter],
    O_KEY_ARR[counter += 1]  => array[counter],
    :password_confirmation => array[counter],
    O_KEY_ARR[counter += 1]  => array[counter],
      )
  o.avatar.store!(File.open(File.join(Rails.root, "public/seed-photos/" + array[0].downcase.gsub(" ", "_") + ".jpg")))
  o.save!
end