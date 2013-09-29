module API
  class Hairdressers < Grape::API
    format :json

    desc "Index"
    get '/' do
      Hairdresser.new
    end

  end
end