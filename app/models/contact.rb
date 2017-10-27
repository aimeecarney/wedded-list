class Contact < ApplicationRecord
  has_many :list_contacts
  has_many :lists, through: :list_contacts
  validates_presence_of :name, :city, :state, :message => "^Field Required"
end
