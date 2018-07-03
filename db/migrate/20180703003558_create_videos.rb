class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
    t.string :title, :large_cover_url, :small_cover_url
    t.text   :description
    t.timestamps
    end
  end
end
