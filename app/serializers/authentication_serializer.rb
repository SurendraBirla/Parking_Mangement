class AuthenticationSerializer < ActiveModel::Serializer
  has_many :vehicles ,dependent: :destroy
  attributes :id ,:email, :password , :name, :mobile_nu, :address , :license_nu
end
