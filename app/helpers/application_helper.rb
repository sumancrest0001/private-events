module ApplicationHelper
  include UserHelper

  def full_title(page_title = '')
    base_title = 'Ruby on Rails Private Events Project'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end
end
