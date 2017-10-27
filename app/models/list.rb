class List < ApplicationRecord
  belongs_to :user
  has_many :list_contacts
  has_many :contacts, through: :list_contacts

  validates_format_of :date, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "Date must be in the following format: mm/dd/yyyy"
  validates :state, length: { maximum: 2 }
  validates_presence_of :street, :city, :date, :name, :message => "^Required Fields"
  validates :name, uniqueness: true
end
