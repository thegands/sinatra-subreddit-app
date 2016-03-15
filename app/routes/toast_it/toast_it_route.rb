module Sinatra
  module Web
    module Routing
      module ToastItRoute
        def self.registered(app)

          app.get  '/toast-it' do
            haml :'toast/index'
          end

          app.get  '/toast-it/topics' do
            haml :'toast/index'
          end

          app.get  '/toast-it/topics/new' do
            if logged_in?
              haml :'toast/topics/new'
            else
              session[:redir] = request.path_info
              redirect '/login'
            end
          end

          app.post  '/toast-it/topics' do
            topic = Topic.new(params)
            if topic.save
              current_user.topics << topic
              redirect "/toast-it/topics/#{topic.id}"
            else
              "error"
            end
          end

          app.get  '/toast-it/topics/:id' do
            @topic = Topic.find(params[:id])
            haml :'toast/topics/show'
          end

          app.post  '/toast-it/topics/:id' do
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
