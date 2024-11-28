class CreateGroupClasses < ActiveRecord::Migration[7.2]
  def change
    create_table :group_classes do |t|
      t.references :gym_staff, null: false, foreign_key: true
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
