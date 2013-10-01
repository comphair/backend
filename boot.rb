require "./env"

ApplicationServer = Rack::Builder.new do
  if ENV["ENV"] == "development"
    use BetterErrors::Middleware
    use Rack::Static, :urls => ["/swagger"], :root => "public", index: "index.html"
  end

  map "/" do
    run API::Root
  end
end