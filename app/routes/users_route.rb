module Sinatra
  module Web
    module Routing
      module UsersRoute

        def self.registered(app)
          app.get '/register' do
            if logged_in?
              url_redirect
            else
              session.delete(:failed_name)
              haml :'users/signup'
            end
          end

          app.post '/signup' do
            # if params[:password].length > 7
            #   if params[:password] == params[:confirm_password]
            #     if params[:name].match(/\A[A-Za-z0-9]+\z/) && (3..14).include?(params[:name].length)
                  @user = User.new(name: params[:name], password: params[:password])
                  if @user.save
                    session.delete(:failed_name)
                    session[:id] = @user.id
                    url_redirect
                  else
                    session.delete(:failed_name)
                    haml :'users/signup', locals: {message: "Registration invalid. Please try again"}
                  end
            #     else
            #       session.delete(:failed_name)
            #       haml :'users/signup', locals: {message: "Your username must contain only alphanumeric characters and be between 3 and 14 characters long"}
            #     end
            #   else
            #     session[:failed_name] = params[:name]
            #     haml :'users/signup', locals: {message: "Passwords did not match. Please try again"}
            #   end
            # else
            #   session[:failed_name] = params[:name]
            #   haml :'users/signup', locals: {message: "Password must be at least 8 characters long"}
            # end
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
            @user = current_user if logged_in?
            @view_user = User.find_by(name: params[:name])
            if @view_user
              haml :'users/show'
            else
              status 404
            end
          end

          app.delete '/users/:name/delete' do
            if logged_in?
              user = current_user
              delete_user = User.find_by(name: params[:name])
              if user && delete_user == user
                user.scores.destroy_all
                user.destroy
                session.clear
                redirect '/'
              else
                status 400
              end
            else
              session[:redir] = "/users/#{params[:name]}"
              redirect '/login'
            end
          end

          app.delete '/users/:name/delete/all' do
            if logged_in?
              user = current_user
              delete_user = User.find_by(name: params[:name])
              if user && delete_user == user
                user.scores.destroy_all
                user.comments.destroy_all
                user.topics.destroy_all
                user.destroy
                session.clear
                redirect '/'
              else
                status 400
              end
            else
              session[:redir] = "/users/#{params[:name]}"
              redirect '/login'
            end
          end

        end
      end
    end
  end
end
