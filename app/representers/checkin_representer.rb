class CheckinRepresenter < Napa::Representer
  property :id, type: String
  property :user_id
  property :business_id
  property :created_at
end
