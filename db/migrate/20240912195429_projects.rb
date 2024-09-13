class Projects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :status, default: :ready

      t.timestamps
    end
  end
end
