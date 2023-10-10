class Management < ApplicationRecord
  belongs_to :organisation
  has_many :activities
end
