require "./env"

class API::Root < API::Base
  mount API::Customers
  mount API::Stores
  mount API::Placekeepers
  mount API::Appointments

  if ENV["ENV"] == "development"
    API::Root.add_swagger_documentation mount_path: "/docs",
                                        hide_documentation_path: true
  end
end

ApplicationServer = Rack::Builder.new do
  if ENV["ENV"] == "development"
    use BetterErrors::Middleware
    use Rack::Static, :urls => ["/swagger"], :root => "public", index: "index.html"
    map "/sidekiq" do
      run Sidekiq::Web
    end
  end

  map "/" do
    run API::Root
  end
end