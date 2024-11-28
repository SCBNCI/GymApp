class CreateGymStaffs < ActiveRecord::Migration[7.2]
  def change
    create_table :gym_staffs do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.date :birth_date
      t.string :address
      t.date :admission_date

      t.timestamps
    end
  end
end
