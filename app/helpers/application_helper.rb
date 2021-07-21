module ApplicationHelper
  def url_for_github(user)
    "https://github.com/#{user.name}"
  end

  def devise_page
    %w[new_user_registration new_user_session edit_user_registration].any? { |name| current_page?(send("#{name}_path")) }
  end
end
