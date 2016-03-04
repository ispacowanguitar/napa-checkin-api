class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  mount BusinessesApi => '/businesses'
  mount CheckinsApi => '/checkins'
  
  add_swagger_documentation
end

