module Sinatra
  module Web
    module Routing
      module ToastItRoute
        def self.registered(app)
          app.get  '/toast-it' do
            haml :'homepage/index'
          end
        end
      end
    end
  end
end
