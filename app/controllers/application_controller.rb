class ApplicationController < ActionController::Base
  # layout :products_layout

  def after_sign_in_path_for(resource)
    if current_user.role == 'admin'
      trips_path
    else
      root_path
    end
  end
end
