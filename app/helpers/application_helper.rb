module ApplicationHelper
  # def custom_form_for record, options = {}, &proc
  #   form_for record, options.merge!(builder: CustomFormBuilder), &proc
  # end

  def average_rating reviews
    reviews.map(&:rating).sum.fdiv(reviews.size).round(1)
  end
end
