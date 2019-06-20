class Viber::User::Operation::Create < Trailblazer::Operation
  step :model!
  step :prepare_data!
  step Lib::Macro::DryContract::Build(constant: Viber::User::Contract::Create)
  step Lib::Macro::DryContract::Validate(), fail_fast: true
  step Lib::Macro::DryContract::Sync(save: true)
  step :handle_callback!

  def model!(ctx, account:, **)
    ctx[:model] = account.users.new
  end

  def prepare_data!(ctx, params:, **)
    return unless params[:user]

    ctx[:params] = params[:user].merge(external_id: params[:user][:id])
  end

  def handle_callback!(_ctx, callback:, **)
    callback.update(handled: true)
  end
end
