class AddClassTypeToGroupClasses < ActiveRecord::Migration[7.2]
  def change
    add_column :group_classes, :class_type, :string
  end
end
