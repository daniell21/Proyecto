module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    
      <a href="#" data-dismiss="alert" class="close">×</a>
        <div class="alert alert-alert">
      <strong style="color:red;">
      </strong>
      #{messages}
    </span>
      </div>
    HTML

    html.html_safe
  end
end