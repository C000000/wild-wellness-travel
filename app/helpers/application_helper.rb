module ApplicationHelper
  def cp(path)
    "current" if current_page?(path)
  end

  def a_cp(path)
    "active_link" if current_page?(path)
  end
end
