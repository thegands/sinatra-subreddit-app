module EvalScore
  def score
    2 * self.scores.count { |s| s.liked } - self.scores.count
  end
end
