class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  devise_group :user, contains: [:user]

  before_action :require_allowed_user!

  def require_allowed_user!
    # reject unallowed user
    return if current_user.present?
    return if params[:controller] == 'key_resources' && params[:action] == 'index'
    authenticate_user!
  end

  # # Overwriting the sign_out redirect path method
  # def after_sign_out_path_for(_resource_or_scope)
  #   cas_opts = YAML.load_file(File.join(Rails.root, 'config', 'cas.yml'))[Rails.env] || {}

  #   # In non-deployed environments, or if CAS options are absent, we should only
  #   # do application-level logout, not CAS logout. Warn, and proceed.
  #   if request.host == 'localhost' || cas_opts['host'].blank? || cas_opts['logout_url'].blank?
  #     Rails.logger.error 'CAS options missing - skipping CAS logout!'
  #     return root_path
  #   end

  #   # Full CAS logout + application logout page looks like this:
  #   # https://cas.columbia.edu/cas/logout?service=https://helpdesk.cul.columbia.edu/welcome/logout
  #   cas_logout_url = 'https://' + cas_opts['host'] + cas_opts['logout_url']
  #   service = request.base_url + root_path
  #   after_sign_out_path = "#{cas_logout_url}?service=#{service}"
  #   Rails.logger.debug "after_sign_out_path = #{after_sign_out_path}"
  #   after_sign_out_path
  # end
end
