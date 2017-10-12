module AdminSidebarHelper
  def dashboard_active
    "class=active" if controller_name == 'base' && action_name == 'dashboard'
  end

  def categories_active
    "class=active" if controller_name == 'categories'
  end

  def files_active
    "class=active" if controller_name == 'file_items'
  end

  def posts_active
    "class=active" if controller_name == 'posts'
  end

  def pages_active
    "class=active" if controller_name == 'pages'
  end
end
