class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, except: [:index], notice: 'you must sign in first!'
  def after_sign_in_path_for(resource)
    # byebug
    if current_user.role == 'admin'
      byebug
      admins_path
    else
      root_path
      # new_user_session_path
    end
  end
end
