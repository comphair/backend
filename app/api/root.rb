module API
  class Root < Grape::API
    mount API::Stores
    add_swagger_documentation mount_path: "/docs",
                              hide_documentation_path: true
  end
end