class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.string :sender
      t.integer :time_to_live
      t.string :source
      t.integer :priority

      t.timestamps null: false
    end
  end
end
