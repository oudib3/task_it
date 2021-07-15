class CreateDescriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :descriptions do |t|
      t.string :content, null: false
      t.references :descriptable, polymorphic: true, null: false
      t.timestamps
    end
  end
end