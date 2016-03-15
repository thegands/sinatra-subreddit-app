module Sinatra
  module Web
    module Routing
      module Homepage
        def self.registered(app)
          app.get '/' do
            if logged_in?
              @user = current_user
            end
            haml :'homepage/index'
          end
        end
      end
    end
  end
end
