class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent
  helper_method :current_booking

  def current_booking
    if !session[:booking_id].nil?
      Booking.find(session[:booking_id])
    else
      Booking.new
    end
  end

end
