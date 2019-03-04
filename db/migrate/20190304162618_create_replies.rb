class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.text :body
      t.integer :user_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
