class ListContact < ApplicationRecord
  belongs_to :list
  belongs_to :contact
end
