json.array! @bookings do |booking|
  date_format = '%Y-%m-%d'
  color = ["black", "#83adef", "#6aedbd", "#e8ef23", "#f2a757", "#e5424a","#c6bebf"]


  json.id booking.id
  json.title "Booking " + booking.id.to_s
  json.start booking.pickup_date.strftime(date_format)
  json.end (booking.return_date + 1.days).strftime(date_format)

  json.user_id booking.user_id
  json.project_id booking.project_id
  json.color color[booking.booking_status_id]
  json.message booking.message

  json.update_url booking_path(booking, method: :patch)
  json.edit_url edit_booking_path(booking)
end
