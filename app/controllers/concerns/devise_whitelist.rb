module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
      before_action :configure_permitted_parameters, if: :devise_controller?
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:name,
                                                          :street,
                                                          :matriculation_number,
                                                          :postal_code,
                                                          :city
    ])
    devise_parameter_sanitizer.permit(:account_update, :keys => [:name,
                                                                 :street,
                                                                 :matriculation_number,
                                                                 :postal_code,
                                                                 :city
    ])
  end
end