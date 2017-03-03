class MapsController < ApplicationController
  def index
    @locations = Location.all
    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.infowindow location.description
      marker.json({title: location.title})
    end
    @location = Location.find(1)
  end
end
