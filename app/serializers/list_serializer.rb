class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :city, :state
  has_many :contacts
end
