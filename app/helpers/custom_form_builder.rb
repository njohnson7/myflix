# app/helpers/custom_form_builder.rb

class CustomFormBuilder < ActionView::Helpers::FormBuilder
  def label method, text = nil, options = {}, &block
    errors = object.errors[method.to_sym]
    if errors.any?
      text += " <span class='alert alert-danger'>#{errors.first}</span>"
    end
    super method, text.html_safe, options, &block
  end
end
