class User < ApplicationRecord
    has_secure_password
    has_many :vehicles 
  
    validates :email, presence: true, uniqueness: true
    validates :password , presence: true
    validates :name, presence: true
    validates :mobile_nu, presence: true
    validates :address, presence: true 

    def self.ransackable_associations(auth_object = nil)
      ["vehicles"]
    end

    def self.ransackable_attributes(auth_object = nil)
      ["address", "created_at", "email", "id", "id_value", "mobile_nu", "name", "password_digest", "updated_at","license_nu"]
    end

  end
  