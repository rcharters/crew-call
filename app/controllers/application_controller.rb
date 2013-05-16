class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    case current_user.roles.first.name
      when 'admin'
        # users_path
        resource.roles.first.name == 'admin' ? admin_dashboard_path : user_path(resource)
      when 'silver'
        content_silver_path
      when 'gold'
        content_gold_path
      when 'platinum'
        content_platinum_path
      else
        root_path
    end
  end
  

  #
  # redirect registered users to a profile page
  # of to the admin dashboard if the user is an administrator
  #

  # def authorize_admin_user!
  #   case current_user.roles.first.name
  #     when 'admin'
  #       :authorize_user! :authorize_admin_user!
  #     else

  #   end
  # end
    

  #   user ||= User.new # guest user (not logged in)
  #   if user.has_role? :admin
  #     :authorize! :authorize_admin_user! @user, :message => 'Not authorized as an administrator.'
  #   else
  #   end

end