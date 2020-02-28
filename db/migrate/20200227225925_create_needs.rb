# frozen_string_literal: true

class CreateNeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :needs do |t|
      t.integer :hunger, null: false
      t.integer :comfort, null: false
      t.integer :bladder, null: false
      t.integer :energy, null: false
      t.integer :fun, null: false
      t.integer :social, null: false
      t.integer :hygiene, null: false
      t.integer :environment, null: false
      t.references :mood, foreign_key: true

      t.timestamps
    end
  end
end
