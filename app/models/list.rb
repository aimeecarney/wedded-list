class List < ApplicationRecord
  belongs_to :user
  has_many :list_contacts
  has_many :contacts, through: :list_contacts
  before_save :uppcase_field

  validates_format_of :date, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "Date must be in the following format: mm/dd/yyyy"
  validates :state, length: { maximum: 2 }
  validates_presence_of :street, :city, :date, :name, :message => "^Required Fields"

  def uppcase_field
    self.state.upcase!
  end

end
