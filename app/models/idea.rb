class Idea < ActiveRecord::Base

  belongs_to :user
  has_many :idea_votes, dependent: :destroy

  attr_accessible :title, :description

  def self.by_votes
    select('ideas.*, sum(coalesce(value, 0)) as votes').
    joins('left join idea_votes on ideas.id = idea_votes.idea_id').
    group('ideas.id').
    order('votes desc')
  end

  def votes
    read_attribute(:votes) || idea_votes.sum(:value)
  end

  def user_vote(user)
    self.idea_votes.where('user_id = ?', user.id)
  end

end
