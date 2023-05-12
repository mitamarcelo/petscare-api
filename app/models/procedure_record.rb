class ProcedureRecord < ApplicationRecord
  enum category: {
    annotation: 'annotation',
    appointment: 'appointment',
    deworming: 'deworming',
    flea_and_tick: 'flea_and_tick',
    other: 'other',
    medicine: 'medicine',
    vaccination: 'vaccination'
  }
  belongs_to :pet
end
