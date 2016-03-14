module Sinatra
  module Web
    module Routing
      module ToastItRoute
        def self.registered(app)
          app.get  '/toast-it' do
            haml :'toast/index'
          end
        end
      end
    end
  end
end
