class API::Hairdressers < API::Base

  desc "Index"
  get 'hairdresser' do
    Hairdresser.all
  end

  desc "Create new"
  params do
    requires :title, type: String, desc: "Title"
  end
  post 'hairdresser' do
    Hairdresser.create!({
      title: params[:title]
      })
  end

end