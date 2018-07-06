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

    normalize_queue_item_positions
    redirect_to my_queue_path
  end

  def update_queue
    update_queue_items
    normalize_queue_item_positions
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Invalid position numbers.'
  ensure
    redirect_to my_queue_path
  end

  #=================================================#
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

  def update_queue_items
    ActiveRecord::Base.transaction do
      params.permit![:queue_items].each do |queue_item_data|
        queue_item = QueueItem.find queue_item_data['id']
        queue_item.update!(position: queue_item_data['position']) if queue_item.user == current_user
      end
    end
  end

  def normalize_queue_item_positions
    current_user.queue_items.each_with_index do |queue_item, index|
      queue_item.update position: index + 1
    end
  end
end
