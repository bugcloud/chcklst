class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.boolean :checked, null: false, default: false
      t.integer :list_id, null: false

      t.timestamps null: false
    end
  end
end
