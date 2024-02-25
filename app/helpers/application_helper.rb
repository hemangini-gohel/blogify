module ApplicationHelper
  def get_sanitize_content(content)
    content.html_safe
  end
end
