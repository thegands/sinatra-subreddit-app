module Sinatra
  module Web
    module Routing
      module CommentsRoute
        def self.registered(app)

          app.get '/toast-it/comments/:id' do
            @topic = Topic.find_by_id(params[:id])
            if @topic
              if logged_in?
                @user = current_user
                @liked = @topic.liked?(@user)
                haml :'toast/topics/show'
              end
            else
              status 404
            end
          end

          app.post '/toast-it/comments/:id' do
            if logged_in?
              comment = Comment.new(params[:comment])
              if comment.save && topic = Topic.find_by_id(params[:id])
                current_user.comments << comment
                topic.comments << comment
                redirect "/toast-it/topics/#{topic.id}"
              else
                status 404
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
