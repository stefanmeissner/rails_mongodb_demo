class Athlet
  include Mongoid::Document
  field :first_name
  field :last_name

  embeds_many :training_records
end
