module Sinatra
  module Web
    module Routing
      module CommentsRoute
        def self.registered(app)

          app.get '/toast-it/comments/:id' do
            @comment = Comment.find_by_id(params[:id])
            if @comment
              if logged_in? && current_user == @comment.user
                haml :'toast/comments/edit'
              else
                status 400
              end
            else
              status 404
            end
          end

          app.put '/toast-it/comments/:id' do
            if logged_in?
              comment = Comment.find_by_id(params[:id])
              if comment && comment.user == current_user && comment.update(params[:comment])
                redirect "/toast-it/topics/#{comment.topic.id}"
              else
                status 400
              end
            else
              session[:redir] = request.path_info
              redirect '/login'
            end
          end

          app.delete '/toast-it/comments/:id/delete' do
            if logged_in?
              comment = Comment.find_by_id(params[:id])
              if comment && comment.user == current_user
                redir = comment.topic.id
                comment.destroy
                redirect "/toast-it/topics/#{redir}"
              else
                status 400
              end
            else
              session[:redir] = "toast-it/topics/#{params[:id]}"
              redirect '/login'
            end
          end

        end
      end
    end
  end
end
