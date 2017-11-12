class List < ApplicationRecord
  belongs_to :user
  has_many :list_contacts
  has_many :contacts, through: :list_contacts
  before_save :uppcase_field

  validates_format_of :date, :with => /\d{2}\/\d{2}\/\d{4}/
  validates :state, length: { maximum: 2 }
  validates_presence_of :street, :city, :date, :name

  def uppcase_field
    self.state.upcase!
  end

  def contacts_attributes=(contacts_attributes)
    contacts_attributes.values.each do |contact_attributes|
      self.contacts.build(contact_attributes)
    end
  end

end
