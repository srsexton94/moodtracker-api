class CreateMoods < ActiveRecord::Migration[5.2]
  def change
    create_table :moods do |t|
      t.boolean :happy
      t.boolean :calm
      t.boolean :sad
      t.boolean :nervous
      t.boolean :energetic
      t.boolean :angry

      t.timestamps
    end
  end
end
