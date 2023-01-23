class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index], notice: 'you must sign in first!'
  def after_sign_in_path_for(resource)
    if current_user.role == 'admin'
      trips_path
    else
      root_path
    end
  end
end
