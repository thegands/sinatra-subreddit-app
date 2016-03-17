module Sinatra
  module Web
    module Routing
      module ScoresRoute
        def self.registered(app)

          app.post '/toast-it/topics/:id/toast' do
            if logged_in?
              # binding.pry
              score = Score.new(liked: params[:liked])
              if topic = Topic.find(params[:id])
                if topic.scores << score && current_user.scores << score
                  redirect request.referrer
                else
                  old_score = topic.scores.detect{ |s| s.user == current_user }
                  if old_score.liked == score.liked
                    score.destroy
                    old_score.destroy
                    redirect request.referrer
                  elsif old_score
                    score.destroy
                    old_score.update(liked: params[:liked])
                    redirect request.referrer
                  else
                    score.destroy
                    "an error occured during the score association"
                  end
                end
              else
                score.destroy
                "There was a problem or the topic was not found"
              end
            else
              session[:redir] = request.referrer
              redirect '/login'
            end
          end

          app.post '/toast-it/comments/:id/toast' do
            if logged_in?
              # binding.pry
              score = Score.new(liked: params[:liked])
              if comment = Comment.find(params[:id])
                if comment.scores << score && current_user.scores << score
                  redirect request.referrer
                else
                  old_score = comment.scores.detect{ |s| s.user == current_user }
                  if old_score.liked == score.liked
                    score.destroy
                    old_score.destroy
                    redirect request.referrer
                  elsif old_score
                    score.destroy
                    old_score.update(liked: params[:liked])
                    redirect request.referrer
                  else
                    score.destroy
                    "an error occured during the score association"
                  end
                end
              else
                score.destroy
                "There was a problem or the topic was not found"
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
