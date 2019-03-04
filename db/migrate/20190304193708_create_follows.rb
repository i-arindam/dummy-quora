class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :followable_id
      t.integer :followable_type

      t.timestamps
    end
  end
end
