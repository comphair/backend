module API
  class Root < Grape::API
    mount API::Hairdressers
    add_swagger_documentation mount_path: "/docs",
                              markdown: true,
                              hide_documentation_path: true
  end
end