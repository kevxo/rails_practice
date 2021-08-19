class AddIsAdoptedToChildren < ActiveRecord::Migration[6.1]
  def change
    add_column :children, :is_adopted, :boolean, default: false
  end
end
