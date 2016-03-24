module Vote

  def voted?(user)
    Score.find_by(user: user, post: self)
  end

  def liked?(user)
    if score = voted?(user)
      score.liked
    end
  end

  def upvote(user)
    if score = voted?(user)
      case score.liked
      when true
        score.destroy
        self.score -= 1
        self.save
      when false
        score.update(liked: true)
        self.score += 2
        self.save
      end
    else
      score = Score.new(liked: true)
      self.score += 1
      self.save
      self.scores << score
      user.scores << score
    end
  end

  def downvote(user)
    if score = voted?(user)
      case score.liked
      when false
        score.destroy
        self.score += 1
        self.save
      when true
        score.update(liked: false)
        self.score -= 2
        self.save
      end
    else
      score = Score.new(liked: false)
      self.score -= 1
      self.save
      self.scores << score
      user.scores << score
    end
  end

end
