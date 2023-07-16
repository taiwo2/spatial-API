class SpatialLayer < ApplicationRecord
  geocoded_by :location
  def location
    "#{latitude}, #{longitude}"
  end
  
end
