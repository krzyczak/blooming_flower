class Janusz
  def initialize(user)
    @user = user
    @provider = @user.providers.first
    @auth_data = { "dummy": true }
  end

  def call
    Rollbar.info({
      event: "Connecting New stripe Account - Result",
      user: @user.as_json,
      provider: @provider.as_json,
      auth_data: @auth_data.as_json,
      stripe_services_connector_actions: {
        user_is_persisted: @user.persisted?,
        profile_updated: update_user_profile,
        connect_stripe_account_executed: connect_stripe_account
      }
    }.to_json)


    @user.persisted? && update_user_profile && connect_stripe_account
  rescue StandardError => error
    Rollbar.info({
      event: "Connecting New stripe Account - Failed",
      user: @user.as_json,
      provider: @provider.as_json,
      auth_data: @auth_data.as_json
    }.to_json)

    Rollbar.error(error)

    raise error
  end

  private

  def update_user_profile
    true
  end

  def connect_stripe_account
    raise "fake error"
  end
end


puts Janusz.new(User.first).call
