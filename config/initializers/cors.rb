Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'https://n-srcoukfhwnkmi2hcs2nesuepjujifnywiaaqabi-0lu-script.googleusercontent.com', 'https://script.google.com', 'https://n-6prlwevkkot7xvsah4khgwofoktbzvfsjj6axdq-0lu-script.googleusercontent.com'      resource '*', methods: :any, headers: :any
    end
  end