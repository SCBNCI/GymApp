# Clear existing records to avoid duplication
GroupMember.destroy_all
GroupClass.destroy_all
PrivateClass.destroy_all
GymMember.destroy_all
GymStaff.destroy_all

# Seed data for GymStaff with random names
staff_names = [
  { first_name: "John", last_name: "Smith" },
  { first_name: "Jane", last_name: "Doe" },
  { first_name: "Michael", last_name: "Johnson" },
  { first_name: "Emily", last_name: "Davis" },
  { first_name: "Chris", last_name: "Brown" },
  { first_name: "Sarah", last_name: "Miller" },
  { first_name: "David", last_name: "Wilson" },
  { first_name: "Laura", last_name: "Moore" },
  { first_name: "Kevin", last_name: "Taylor" },
  { first_name: "Sophia", last_name: "Anderson" }
]

# Loop through staff_names and create GymStaff records
staff_names.each_with_index do |name, i|
  GymStaff.create!(
    first_name: name[:first_name],
    last_name: name[:last_name],
    email: "staff#{i + 1}@gym.com",
    password: "password#{i + 1}",
    birth_date: "1980-01-#{i + 10}",
    address: "123 Main St, City #{i + 1}",
    admission_date: "2020-01-#{i + 5}"
  )
end

puts "10 GymStaff members have been created."

# Array of 50 random names for GymMembers
member_names = [
  { first_name: "Amanda", last_name: "Allen" },
  { first_name: "Andrew", last_name: "Jackson" },
  { first_name: "Anthony", last_name: "Smith" },
  { first_name: "Barbara", last_name: "Campbell" },
  { first_name: "Betty", last_name: "Evans" },
  { first_name: "Betty", last_name: "Young" },
  { first_name: "Carol", last_name: "Collins" },
  { first_name: "Charles", last_name: "Hall" },
  { first_name: "Daniel", last_name: "Green" },
  { first_name: "David", last_name: "Collins" },
  { first_name: "David", last_name: "Scott" },
  { first_name: "Donald", last_name: "Miller" },
  { first_name: "Donald", last_name: "White" },
  { first_name: "Donna", last_name: "Jackson" },
  { first_name: "Donna", last_name: "Lee" },
  { first_name: "Donna", last_name: "Nelson" },
  { first_name: "Dorothy", last_name: "Torres" },
  { first_name: "Dorothy", last_name: "Walker" },
  { first_name: "Emily", last_name: "Torres" },
  { first_name: "George", last_name: "Allen" },
  { first_name: "James", last_name: "Green" },
  { first_name: "James", last_name: "Harris" },
  { first_name: "James", last_name: "Parker" },
  { first_name: "John", last_name: "Brown" },
  { first_name: "John", last_name: "Parker" },
  { first_name: "Joseph", last_name: "Johnson" },
  { first_name: "Joseph", last_name: "Robinson" },
  { first_name: "Karen", last_name: "Young" },
  { first_name: "Kenneth", last_name: "Johnson" },
  { first_name: "Kenneth", last_name: "Mitchell" },
  { first_name: "Kenneth", last_name: "Parker" },
  { first_name: "Kevin", last_name: "Davis" },
  { first_name: "Kimberly", last_name: "Jones" },
  { first_name: "Linda", last_name: "Turner" },
  { first_name: "Lisa", last_name: "Walker" },
  { first_name: "Mary", last_name: "Moore" },
  { first_name: "Michelle", last_name: "Brown" },
  { first_name: "Robert", last_name: "Anderson" },
  { first_name: "Robert", last_name: "Clark" },
  { first_name: "Robert", last_name: "Perez" },
  { first_name: "Sandra", last_name: "Anderson" },
  { first_name: "Sandra", last_name: "Hall" },
  { first_name: "Sandra", last_name: "Smith" },
  { first_name: "Sarah", last_name: "Edwards" },
  { first_name: "Sarah", last_name: "King" },
  { first_name: "Sarah", last_name: "Lee" },
  { first_name: "Sarah", last_name: "Robinson" },
  { first_name: "Thomas", last_name: "Johnson" },
  { first_name: "Thomas", last_name: "Lewis" }
]

# Create GymMember entries
member_names.each_with_index do |name, i|
  GymMember.create!(
    first_name: name[:first_name],
    last_name: name[:last_name],
    email: "member#{i + 1}@gym.com",
    password: "password#{i + 1}",
    birth_date: "1990-01-#{i % 28 + 1}", # Randomized day
    address: "456 Maple Ave, City #{i + 1}"
  )
end

puts "50 GymMembers have been created."

# Seed data for PrivateClass
5.times do |i|
  PrivateClass.create!(
    gym_staff_id: GymStaff.all.sample.id,
    gym_member_id: GymMember.all.sample.id,
    date: Date.today + i.days,
    time: "10:00:00"
  )
end

puts "5 PrivateClasses have been created."

# Seed data for GroupClass with Class Type
class_types = ["Yoga", "HIIT", "Pilates", "CrossFit", "Spinning"]

# Create 5 group classes with randomized types and staff
5.times do |i|
  group_class = GroupClass.create!(
    gym_staff_id: GymStaff.all.sample.id,
    class_type: class_types.sample, # Added class type
    date: Date.today + i.days,
    time: "14:00:00"
  )
  puts "Created GroupClass with Staff ID: #{group_class.gym_staff_id}, Class Type: #{group_class.class_type}"
end

puts "5 GroupClasses have been created with class types."

# Seed data for GroupMember
5.times do
  GroupMember.create!(
    group_class_id: GroupClass.all.sample.id,
    gym_member_id: GymMember.all.sample.id
  )
end

puts "5 GroupMembers have been created."

puts "Database has been seeded with 10 GymStaff members, 50 GymMembers, 5 PrivateClasses, 5 GroupClasses, and 5 GroupMembers!"
