module Slugify

  def self.included(base)
    base.extend(ClassMethods)
  end

  def slug
    self.username.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  module ClassMethods

    def find_by_slug(slug)
      self.all.find{ |instance| instance.slug == slug }
      # SELECT * FROM users WHERE username = slug
      self.where(:username => slug)
    end

  end

end
