module Sinatra
  module Web
    module Routing
      module UsersRoute
        def self.registered(app)
          app.get '/signup' do
            if logged_in?
              redirect '/toast-it'
            else
              haml :'users/signup'
            end
          end

          app.post '/signup' do
            if params[:password] == params[:confirm_password]
              user = User.new(name: params[:name], password: [:password])
              if user.save
                session[:id] = user.id
                redirect '/toast-it'
              else
                haml :'users/signup', locals: {message: "Registration invalid. Please try again"}
              end
            else
              haml :'users/signup', locals: {message: "Passwords did not match. Please try again"}
            end
          end

          app.get '/login' do
            if logged_in?
              redirect '/toast-it'
            else
              haml :'users/login'
            end
          end

          app.post '/login' do
            user = User.find_by(name: params[:name])
            if user && user.authenticate(params[:password])
              session[:id] = user.id
              redirect '/toast-it'
            else
              haml :'users/login', locals: {message: "Login failed. Please try again"}
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
