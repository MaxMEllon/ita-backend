# frozen_string_literal: true

class UserRepository < Hanami::Repository
  # rubocop:disable Lint/RescueWithoutErrorClass
  def find_by_email!(email)
    find_by_email_base(email, true)
  rescue
    raise $ERROR_INFO
  end
  # rubocop:enable Lint/RescueWithoutErrorClass

  def find_by_email(email)
    find_by_email_base(email)
  end

  def generate_token_of_user(user_id)
    token = SecureRandom.urlsafe_base64(24).tr('lIO0', 'sxyz')
    update(user_id, token: token)
  end

  private

  def find_by_email_base(email, force = false)
    user = users.where(email: email).first
    return user if user
    raise Ita::RecordNotFoundException, 'User not found by email' if force
    false
  end
end
