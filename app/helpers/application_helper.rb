module ApplicationHelper
  def cp(path)
    "current" if current_page?(path)
  end

  def a_cp(path)
    "active_link" if current_page?(path)
  end

  def c_image_path
    "http://res.cloudinary.com/dijinio/image/upload/"
  end
end
