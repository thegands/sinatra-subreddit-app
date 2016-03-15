module Sinatra
  module Web
    module Routing
      module UsersRoute
        def self.registered(app)
          app.get '/signup' do
            if logged_in?
              url_redirect
            else
              session.delete(:failed_name)
              haml :'users/signup'
            end
          end

          app.post '/signup' do
            if params[:password] == params[:confirm_password]
              user = User.new(name: params[:name], password: params[:password])
              if user.save
                session.delete(:failed_name)
                session[:id] = user.id
                url_redirect
              else
                session[:failed_name] = params[:name]
                haml :'users/signup', locals: {message: "Registration invalid. Please try again"}
              end
            else
              session[:failed_name] = params[:name]
              haml :'users/signup', locals: {message: "Passwords did not match. Please try again"}
            end
          end

          app.get '/login' do
            if logged_in?
              url_redirect
            else
              session.delete(:failed_name)
              haml :'users/login'
            end
          end

          app.post '/login' do
            user = User.find_by(name: params[:name])
            if user && user.authenticate(params[:password])
              session[:id] = user.id
              session.delete(:failed_name)
              url_redirect
            else
              session[:failed_name] = params[:name]
              haml :'users/login', locals: {message: "Login information invalid. Please try again"}
            end
          end

          app.get '/logout' do
            if logged_in?
              session.clear
              redirect '/'
            else
              redirect '/'
            end
          end

          app.get '/users/:name' do
            @user = User.find_by(params)
            erb :'users/show'
          end
        end
      end
    end
  end
end
