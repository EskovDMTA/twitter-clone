module SidebarHelper
  def active_link?(link)
    if link === controller_name
      return "active"
    end
  end
end