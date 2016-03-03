class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  mount HelloApi => '/'
  mount BusinessesApi => '/Businesses'

  add_swagger_documentation
end

