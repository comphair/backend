module API
  class Base < Grape::API

    def self.inherited(subclass)
      super
      subclass.instance_eval do
        # add_swagger_documentation
        format :json
      end
    end

  end
end