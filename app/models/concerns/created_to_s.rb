module CreatedToS
  def created_to_s
    diff = TimeDifference.between(Time.now, self.created_at).in_general.detect { |k,v| v != 0 }
    if diff
      if diff.last == 1
        "1 #{diff.first.to_s.chop}"
      else
        "#{diff.last} #{diff.first}"
      end
    else
      "0 seconds"
    end
  end
end
