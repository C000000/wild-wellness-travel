module ApplicationHelper
  def current_p(path)
    "current" if current_page?(path)
  end
end
