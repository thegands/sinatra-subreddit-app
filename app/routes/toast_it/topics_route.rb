module Sinatra
  module Web
    module Routing
      module TopicsRoute
        def self.registered(app)

          ['/toast-it', '/toast-it/topics'].each do |path|
            app.get path do
              if current_user
                @user = current_user
              end
              haml :'toast/index'
            end
          end

          app.get '/toast-it/topics/new' do
            if logged_in?
              haml :'toast/topics/new'
            else
              session[:redir] = request.path_info
              redirect '/login'
            end
          end

          app.post '/toast-it/topics' do
            topic = Topic.new(params)
            if topic.save
              current_user.topics << topic
              redirect "/toast-it/topics/#{topic.id}"
            else
              "error"
            end
          end

          app.get '/toast-it/topics/:id' do
            @topic = Topic.find(params[:id])
            if current_user
              # binding.pry
              @user = current_user
              @liked = @topic.liked?(@user)
            end
            haml :'toast/topics/show'
          end

          app.post '/toast-it/topics/:id' do
            if logged_in?
              comment = Comment.new(params[:comment])
              if comment.save && topic = Topic.find(params[:id])
                current_user.comments << comment
                topic.comments << comment
                redirect "/toast-it/topics/#{topic.id}"
              else
                "error"
              end
            else
              session[:redir] = request.path_info
              redirect '/login'
            end
          end

        end
      end
    end
  end
end
