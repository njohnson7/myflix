class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating, :user_id, :video_id
      t.text :body
      t.timestamps
    end
  end
end
