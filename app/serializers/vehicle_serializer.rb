class VehicleSerializer < ActiveModel::Serializer
  belongs_to :user
  attributes :id, :insurance, :registration_num, :user_id
end
