module API
  class Base < Grape::API

    def self.inherited(subclass)
      super
      subclass.instance_eval do
        format :json
        formatter :json, Grape::Formatter::ActiveModelSerializers
      end
    end

  end
end