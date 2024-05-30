class Vehicle < ApplicationRecord
  belongs_to :user
  
  validates :type_name, presence: true
  validates :insurance, presence: true
  validates :registration_num, presence: true

  # enum :vehicle_code { bike: 50, auto: 75, car: 100, other: 120}

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "insurance",  "type_name", "registration_num", "updated_at", "user_id"]
  end

end
