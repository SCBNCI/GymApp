class GymMember < ApplicationRecord
    has_many :private_classes # A gym member can have many private classes booked
    has_many :group_members # A gym member can have many group memberships
    has_many :group_classes, through: :group_members # A gym member can participate in multiple group classes

    # Method to return the full name of the gym member by combining first_name and last_name
    def full_name
        "#{first_name} #{last_name}"
    end      
end
