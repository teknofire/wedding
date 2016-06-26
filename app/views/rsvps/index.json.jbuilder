json.array!(@rsvps) do |rsvp|
  json.extract! rsvp, :id, :email, :name, :code, :coming, :overnight, :additional_guest, :message
  json.url rsvp_url(rsvp, format: :json)
end
