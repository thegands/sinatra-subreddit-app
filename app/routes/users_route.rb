module Sinatra
  module Web
    module Routing
      module UsersRoute
        def self.registered(app)
          app.get '/signup' do
            if logged_in?
              redirect '/tweets'
            else
              erb :'users/signup'
            end
          end

          app.post '/signup' do
            user = User.new(params)
            if user.save
              session[:id] = user.id
              redirect '/tweets'
            else
              erb :'users/signup', locals: {message: "Registration invalid. Please try again"}
              redirect '/signup'
            end
          end

          app.get '/login' do
            if logged_in?
              redirect '/tweets'
            else
              erb :'users/login'
            end
          end

          app.post '/login' do
            user = User.find_by(name: params[:username])
            if user && user.authenticate(params[:password])
              session[:id] = user.id
              redirect '/tweets'
            else
              erb :'users/login', locals: {message: "Login failed. Please try again"}
            end
          end

          app.get '/logout' do
            if logged_in?
              session.clear
              redirect '/login'
            else
              redirect '/'
            end
          end

          app.get '/users/:slug' do
            @user = User.find_by_slug(params[:slug])
            erb :'users/user_tweets'
          end
        end
      end
    end
  end
end
