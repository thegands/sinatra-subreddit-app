$:.unshift File.expand_path('lib', File.dirname(__FILE__))

require_relative 'config/environment'

class Web < Sinatra::Base
  # Define routes
  use Rack::MethodOverride
  register Sinatra::Web::Routing::CommentsRoute
  register Sinatra::Web::Routing::ScoresRoute
  register Sinatra::Web::Routing::UsersRoute
  register Sinatra::Web::Routing::TopicsRoute
  register Sinatra::Web::Routing::Homepage

  # Helpers
  helpers do
    def logged_in?
      !!session[:id]
    end

    def current_user
      User.find_by_id(session[:id])
    end

    def url_redirect
      if session[:redir]
        redirect session[:redir]
      else
        redirect '/toast-it'
      end
    end
  end

  # Errors
  not_found do
    haml :'404'
  end

  error 400 do
    haml :'400'
  end

  error do
    haml :'500'
  end

  run! if app_file == $0
end
