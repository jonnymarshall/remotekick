module RequestHelper
  def request_location
    request.location.city.presence || "..."
  end
end