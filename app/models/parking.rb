class Parking < ApplicationRecord
    before_validation :set_check_in, on: :create
    before_validation :set_check_out, on: :create

    belongs_to :user
    belongs_to :vehicle
    has_many :reports 

    # enum  status: [:out, :stay]
    # validates :vehicle_type, presence: true
    # validates :vehicle_registration_nu, presence: true


    def self.ransackable_associations(auth_object = nil)
        ["user","vehicle","reports"]
    end
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "id_value", "status", "check_in", "check_out", "updated_at"]
    end

    private 

    def set_check_in
        # debugger
        self.check_in ||= Time.current
    end

    def set_check_out
        self.check_out ||= Time.current + next_ten_hours
    end

    def next_ten_hours
        (60 * 60 * 10)
    end
end
