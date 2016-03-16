module EvalScore
  def score
    2 * Score.where(post: self, liked: true).count - self.scores.count
  end
end
