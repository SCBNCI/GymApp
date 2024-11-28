class PrivateClass < ApplicationRecord
  belongs_to :gym_staff # Each private class is assigned to one gym staff member
  belongs_to :gym_member # Each private class is booked by one gym member
end
