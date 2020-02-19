class CreateStickers < ActiveRecord::Migration[6.0]
  def change
    create_table :stickers do |t|
      t.string :name
      t.string :image
      t.integer :height
      t.integer :width
      t.boolean :favorite, default: false
      t.boolean :selected, default: false

      t.timestamps
    end
  end
end
