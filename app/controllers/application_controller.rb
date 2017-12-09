class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent
  helper_method :current_booking

  def current_booking
    if session[:booking_id].nil? || !Booking.exists?(session[:booking_id])
      booking = Booking.new
      booking.user_id = current_user.id
      booking.booking_status_id = 1
      booking.project_id = 1
      booking.pickup_date = nil
      booking.return_date = nil
      booking

    else
      Booking.find(session[:booking_id])
    end
  end

end
