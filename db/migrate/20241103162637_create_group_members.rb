class CreateGroupMembers < ActiveRecord::Migration[7.2]
  def change
    create_table :group_members do |t|
      t.references :group_class, null: false, foreign_key: true
      t.references :gym_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
