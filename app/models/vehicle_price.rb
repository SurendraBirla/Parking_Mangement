class VehiclePrice < ApplicationRecord
    has_many :vehicles, dependent: :destroy

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "id_value", "price", "type_name", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["vehicles"]
    end
    
    

end
