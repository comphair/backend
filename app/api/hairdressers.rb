class API::Hairdressers < API::Base

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