class Contact < ApplicationRecord
  has_many :list_contacts
  has_many :lists, through: :list_contacts
  validates_presence_of :name, :city, :state
  before_save :uppcase_field

  def uppcase_field
    self.state.upcase!
  end

end
