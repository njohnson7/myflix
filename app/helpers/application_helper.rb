module ApplicationHelper
  def custom_form_for record, options = {}, &proc
    form_for record, options.merge!(builder: CustomFormBuilder), &proc
  end

  def logged_in?
    !!session[:user_id]
  end
end
