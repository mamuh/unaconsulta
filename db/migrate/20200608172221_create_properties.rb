class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.float :lat
      t.float :long
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
