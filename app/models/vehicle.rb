class Vehicle < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle_price
  has_many :parkings, dependent: :destroy
  
  # validates :type_name, presence: true
  validates :insurance, presence: true
  validates :registration_num, presence: true

  # enum :vehicle_code { bike: 50, auto: 75, car: 100, other: 120}

  def self.ransackable_associations(auth_object = nil)
    ["user","vehicle_price","parkings"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "insurance",  "type_name", "registration_num", "updated_at", "user_id", "vehicle_price_id"]
  end

end
