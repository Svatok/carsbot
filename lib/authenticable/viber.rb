module Authenticable::Viber
  private

  def authenticate!
    expected_signature = OpenSSL::HMAC.hexdigest('SHA256', key, request.raw_post)

    head :unauthorized unless expected_signature == signature
  end

  def signature
    request.headers['X-Viber-Content-Signature']
  end

  def key
    Rails.application.credentials.viber_key
  end
end
