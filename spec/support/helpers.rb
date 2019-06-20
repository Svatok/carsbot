module Helpers
  def authentificate!(messenger)
    controller = {
      viber: Api::V1::Viber::CallbacksController
    }[messenger]
    allow_any_instance_of(controller).to receive(:authenticate!)
  end
end
