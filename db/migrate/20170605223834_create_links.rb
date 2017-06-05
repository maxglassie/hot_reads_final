class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.integer :origin_id
      t.string :url
      t.boolean :read, :default => false

      t.timestamps
    end
  end
end
