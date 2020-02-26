class CreateStickerInstances < ActiveRecord::Migration[6.0]
  def change
    create_table :sticker_instances do |t|
      t.references :sticker, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
