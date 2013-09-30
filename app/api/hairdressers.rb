module API
  class Hairdressers < Grape::API
    format :json

    desc "Index"
    get '/' do
      Hairdresser.all
    end

    desc "Create new"
    params do
      requires :title, type: String, desc: "Title"
    end
    post '/' do
      Hairdresser.create!({
        title: params[:title]
        })
    end

  end
end