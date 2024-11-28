class GroupMember < ApplicationRecord
  belongs_to :group_class # Each GroupMember belongs to a specific group class
  belongs_to :gym_member # Each GroupMember also belongs to a specific gym member
end