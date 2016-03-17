module EvalScore

  def score
    2 * Score.where(post: self, liked: true).count - self.scores.count
  end

  def liked?(user)
    if score = Score.find_by(user: user, post: self)
      score.liked
    end
  end

end
