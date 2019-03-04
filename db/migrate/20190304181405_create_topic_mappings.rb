class CreateTopicMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :topic_mappings do |t|
      t.integer :topic_id
      t.integer :question_id

      t.timestamps
    end
  end
end
