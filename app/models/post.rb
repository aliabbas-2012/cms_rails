class Post < ActiveRecord::Base
  # attr_accessible :name, :permalink, :body, :position, :is_visible

  before_create :set_postion

  private
  def set_postion
    last = Post.last
    self.position =  last.nil?? 1:last.position+1
    self.permalink = self.permalink.parameterize
  end

end
