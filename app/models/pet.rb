class Pet < ApplicationRecord
  belongs_to :user
  has_many :procedure_records, dependent: :destroy

  enum species: {
    dog: 'dog',
    cat: 'cat',
    other: 'other'
  }

  enum gender: {
    male: 'male',
    female: 'female'
  }
end
