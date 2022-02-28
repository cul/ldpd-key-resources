permissions_config = Rails.application.config_for(:permissions)

ALLOWED_USER_IDS = permissions_config[:allowed_user_ids] || []
ALLOWED_USER_AFFILS = permissions_config[:allowed_user_affils] || []
