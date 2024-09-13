class Comments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.string :comment, null: false
      t.string :commentor, null: false
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
