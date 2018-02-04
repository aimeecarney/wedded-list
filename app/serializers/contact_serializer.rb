class ContactSerializer < ActiveModel::Serializer
  attributes :id
  has_many :lists
end
