class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.string :list_uuid, null: false,  unique: true
      t.boolean :archived, null: false, default: false

      t.timestamps null: false
    end

    add_index :lists, :list_uuid, unique: true
  end
end
