module EvalScore
  def score
    # WHY DOESNT self.scores.count{ |s| s.liked } WORK???????????????????
    count = 0
    self.scores.each do |s|
      count += 1 if s.liked
    end
    2 * count - self.scores.count
  end
end
