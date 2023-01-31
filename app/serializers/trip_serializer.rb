class TripSerializer < ActiveModel::Serializer
  attributes :id, :trip_name, :trip_type, :amount
end
