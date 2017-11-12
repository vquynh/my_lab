class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent
  helper_method :current_booking
  helper_method :new_booking
  helper_method :delete_current_booking_in_session_and_create_new

  def current_booking
    if !session[:booking_id].nil?
      Booking.find(session[:booking_id])
    else
      booking = Booking.new
      booking.user_id = current_user.id
      booking.booking_status_id = 1
      booking.project_id = 1
      booking
    end
  end
end
