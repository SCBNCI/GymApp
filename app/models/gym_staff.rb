class GymStaff < ApplicationRecord
    has_many :private_classes # A gym staff member can manage multiple private classes
    has_many :group_classes # A gym staff member can also oversee multiple group classes
  
    # Method to return the full name of the gym staff by combining first_name and last_name
    def full_name
      "#{first_name} #{last_name}"
    end
  end
