# app/helpers/application_helper.rb

module ApplicationHelper
  # def custom_form_for record, options = {}, &proc
  #   form_for record, options.merge!(builder: CustomFormBuilder), &proc
  # end

  def average_rating reviews
    reviews.map(&:rating).sum.fdiv(reviews.size).round(1)
  end

  def options_for_video_reviews selected = nil
    options_for_select((1..5).map { |n| [pluralize(n, 'Star'), n] }, selected)
  end
end
