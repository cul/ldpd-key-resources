require 'omniauth/cul'

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # See https://github.com/omniauth/omniauth/wiki/FAQ#rails-session-is-clobbered-after-callback-on-developer-strategy
  # The CAS login redirect to the columbia_cas callback endpoint AND the developer form submission to the
  # developer_uid callback do not send authenticity tokens, so we'll skip token verification for these actions.
  skip_before_action :verify_authenticity_token, only: [:columbia_cas, :developer_uid]

  # POST /users/auth/developer_uid/callback
  def developer_uid
    return unless Rails.env.development? # Only allow this action to run in the development environment
    uid = params[:uid]

    user = User.find_by(
      uid: uid
    ) || User.create!(
      uid: uid,
      email: "#{uid}@example.com",
      first_name: 'uid',
      last_name: 'User',
      password: Devise.friendly_token[0, 20] # Password does not matter for development user
    )

    sign_in_and_redirect user, event: :authentication # this will throw if user is not activated
  end

  # POST /users/auth/columbia_cas/callback
  def columbia_cas
    callback_url = user_columbia_cas_omniauth_callback_url # The columbia_cas callback route in this application
    uid, _affils = Omniauth::Cul::ColumbiaCas.validation_callback(request.params['ticket'], callback_url)

    if Omniauth::Cul::PermissionFileValidator.permitted?(uid, _affils)
      user = User.find_by(uid: uid) || User.create!(
        uid: uid,
        email: "#{uid}@columbia.edu",
        # Only keep the line below if you're using the :database_authenticatable Devise module.
        # Omniauth login doesn't use a password (so the password value doesn't matter to Omniauth),
        # but your app's setup might require a password to be assigned to new users.
        password: Devise.friendly_token[0, 20]
      )
      sign_in_and_redirect user, event: :authentication # this will throw if user is not activated
    else
      flash[:alert] = 'Login attempt failed'
      redirect_to root_path
    end
  rescue Omniauth::Cul::Exceptions::Error => e
    # If an unexpected CAS ticket validation occurs, log the error message and ask the user to try
    # logging in again.  Do not display the exception object's original message to the user because it may
    # contain information that only a developer should see.
    error_message = 'CAS login validation failed.  Please try again.'
    Rails.logger.debug(error_message + "  #{e.class.name}: #{e.message}")
    flash[:alert] = error_message
    redirect_to root_path
  end
end
