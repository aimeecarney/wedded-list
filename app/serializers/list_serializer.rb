class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :city, :state
end
