class GroupClass < ApplicationRecord
  belongs_to :gym_staff # Each group class is associated with one gym staff member
  has_many :group_members, dependent: :destroy # This will delete associated group members when the group class is deleted
  has_many :gym_members, through: :group_members # A group class can have many gym members
  validates :class_type, presence: true # Ensure that the class_type attribute is always present

  # Method to return a description for each class type
  def class_description
    case class_type
    when "Yoga"
      "Yoga is a mind and body practice with a 5,000-year history in ancient Indian philosophy."
    when "Pilates"
      "Pilates focuses on posture, balance, and flexibility to improve overall core strength."
    when "CrossFit"
      "CrossFit is a high-intensity fitness program incorporating elements from various sports and exercises."
    when "Zumba"
      "Zumba is a dance workout that combines Latin and international music with fun and effective exercise."
    when "Spinning"
      "Spinning is a high-energy indoor cycling class with great music and a motivating atmosphere."
    else
      "Description not available for this class type."
    end
  end
end
