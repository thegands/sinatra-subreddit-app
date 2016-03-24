module Sinatra
  module Web
    module Routing
      module ScoresRoute
        def self.registered(app)

          app.post '/toast-it/topics/:id/toast' do
            if logged_in?
              if (topic = Topic.find_by_id(params[:id])) && current_user
                if params[:liked] == "true"
                  topic.upvote(current_user)
                  redirect request.referrer
                else
                  topic.downvote(current_user)
                  redirect request.referrer
                end
              else
                status 404
              end
            else
              session[:redir] = request.referrer
              redirect '/login'
            end
          end

          app.post '/toast-it/comments/:id/toast' do
            if logged_in?
              if (comment = Comment.find_by_id(params[:id])) && current_user
                if params[:liked] == "true"
                  comment.upvote(current_user)
                  redirect request.referrer
                else
                  comment.downvote(current_user)
                  redirect request.referrer
                end
              else
                status 404
              end
            else
              session[:redir] = request.referrer
              redirect '/login'
            end
          end

        end
      end
    end
  end
end
