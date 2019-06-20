class Viber::Callback::Operation::Create < Trailblazer::Operation
  step :account!
  step :model!
  step :callback_data!
  step Lib::Macro::DryContract::Build(constant: Viber::Callback::Contract::Create)
  step Lib::Macro::DryContract::Validate(), fail_fast: true
  step Lib::Macro::DryContract::Sync(save: true)

  step :callback_handler!
  step :handle_callback!

  def account!(ctx, **)
    ctx[:account] = Viber::Account.take
  end

  def model!(ctx, account:, **)
    ctx[:model] = account.callbacks.new
  end

  def callback_data!(_ctx, model:, params:, **)
    model.data = params.except(*model.class.column_names)
  end

  def callback_handler!(ctx, model:, **)
    ctx[:callback_handler] = {
      subscribed: Viber::User::Operation::Create
    }[model.event.to_sym]
  end

  def handle_callback!(ctx, callback_handler:, params:, **)
    ctx[:'handler.result'] = callback_handler.call(params: params, callback: ctx[:model])
    ctx[:'handler.result'].success?
  end
end
