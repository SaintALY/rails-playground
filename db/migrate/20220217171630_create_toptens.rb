class CreateToptens < ActiveRecord::Migration[6.1]
  def change
    create_table :toptens do |t|
      t.string :name
      t.text :comment
      t.string :address
      t.integer :stars

      t.timestamps
    end
  end
end
