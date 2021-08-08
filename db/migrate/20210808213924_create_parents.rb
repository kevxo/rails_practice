class CreateParents < ActiveRecord::Migration[6.1]
  def change
    create_table :parents do |t|
      t.string :name
      t.integer :age
      t.boolean :married

      t.timestamps
    end
  end
end
