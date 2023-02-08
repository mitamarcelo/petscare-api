class Pet < ApplicationRecord
  belongs_to :user
  has_many :procedure_records
end
