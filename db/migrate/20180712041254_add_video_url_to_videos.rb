class AddVideoUrlToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :video_url, :string
  end
end
