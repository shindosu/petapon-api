class CreateDeviceInstances < ActiveRecord::Migration[6.0]
  def change
    create_table :device_instances do |t|
      t.references :device, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
