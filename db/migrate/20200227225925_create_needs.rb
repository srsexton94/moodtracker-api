class CreateNeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :needs do |t|
      t.integer :hunger
      t.integer :comfort
      t.integer :bladder
      t.integer :energy
      t.integer :fun
      t.integer :social
      t.integer :hygiene
      t.integer :environment
      t.references :mood, foreign_key: true

      t.timestamps
    end
  end
end
