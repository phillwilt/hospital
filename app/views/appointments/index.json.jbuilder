json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :physician_id, :patient_id, :date
  json.url appointment_url(appointment, format: :json)
end
