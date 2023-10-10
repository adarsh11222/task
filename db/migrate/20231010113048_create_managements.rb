class CreateManagements < ActiveRecord::Migration[7.0]
  def change
    create_table :managements do |t|
      t.string :name
      t.string :work
      t.references :organisation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
