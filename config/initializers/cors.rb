# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#     allow do
#       origins '*'  
#       resource '*', headers: :any, methods: [:get, :post]
#     end
#   end
  
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # ⚠️ Change '*' to your React frontend domain in production
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
