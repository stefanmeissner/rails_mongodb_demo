class TrainingRecord
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes

  field :start, type: DateTime
  field :end, type: DateTime

  embedded_in :athlet
end
