class Contact < ApplicationRecord
  has_many :list_contacts
  has_many :lists, through: :list_contacts
end
