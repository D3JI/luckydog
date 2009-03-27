class Ask < ActiveRecord::Base
  belongs_to :user
  has_many :answers, :dependent => :destroy
  belongs_to :ask_category

  def solvedanswer
    @answer = Answer.find_by_ask_id(self.id, :conditions => {:status => true})
  end

end
