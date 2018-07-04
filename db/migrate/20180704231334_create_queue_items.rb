class CreateQueueItems < ActiveRecord::Migration[5.2]
  def change
    create_table :queue_items do |t|
      t.integer :video_id, :user_id
      t.integer :position
      t.timestamps
    end
  end
end
