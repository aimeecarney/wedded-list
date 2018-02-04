class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :city, :state, :contacts
  has_many :contacts
end
