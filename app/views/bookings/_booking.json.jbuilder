date_format = '%Y-%m-%d'

json.id booking.id
json.start booking.pickup_date.strftime(date_format)
json.end booking.return_date.strftime(date_format)

json.user_id booking.user_id
json.project_id booking.project_id
json.booking_status_id booking.booking_status_id
json.message booking.message

json.update_url booking_path(booking, method: :patch)
json.edit_url edit_booking_path(booking)
