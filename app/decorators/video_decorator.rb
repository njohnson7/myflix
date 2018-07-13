# app/decorators/video_decorator.rb

class VideoDecorator < Draper::Decorator
  delegate_all

  def rating
    object.rating.present? ? "#{object.rating}/5.0" : 'N/A'
  end
end
