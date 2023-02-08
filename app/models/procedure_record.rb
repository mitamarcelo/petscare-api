class ProcedureRecord < ApplicationRecord
  enum category: {
    appointment: 'appointment',
    vaccination: 'vaccination',
    deworming: 'deworming',
    flea_and_tick: 'flea_and_tick',
    other: 'other'
  }
  belongs_to :pet
end
