class SignupSerializer < ActiveModel::Serializer
  attributes :id, :time
  belongs_to :camper
  has_one :activity
end
