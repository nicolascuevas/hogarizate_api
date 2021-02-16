Rails.application.config.middleware.insert_before 0, Rack::Cors do



  allow do
    origins 'hogarizate.cl'
    resource 'hogarizate.cl',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end

  allow do
    origins 'back.hogarizate.cl'
    resource 'back.hogarizate.cl',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end



end