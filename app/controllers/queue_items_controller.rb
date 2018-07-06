# app/controllers/queue_items_controller.rb

class QueueItemsController < ApplicationController
  before_action :require_user

  def index
    @queue_items = current_user.queue_items.sort_by &:position
  end

  def create
    video = Video.find params[:video_id]
    queue_video video
    redirect_to my_queue_path
  end

  def destroy
    queue_item = QueueItem.find params[:id]
    queue_item.destroy if current_user.queue_items.include?(queue_item)
    redirect_to my_queue_path
  end

  def update_all
    positions = params.require(:queue_item_positions).permit!
    positions.as_json.sort_by { |(_, pos)| pos.to_i }.each_with_index { |(id, pos), idx| QueueItem.find(id).update(position: idx + 1) }

    ap QueueItem.all

    redirect_to my_queue_path
  end


  private

  def queue_video video
    unless current_user_queued_video? video
      QueueItem.create(video: video, user: current_user, position: new_queue_item_position)
    end
  end

  def new_queue_item_position
    current_user.queue_items.count + 1
  end

  def current_user_queued_video? video
    current_user.queue_items.map(&:video).include? video
  end
end
