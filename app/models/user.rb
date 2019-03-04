class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions
  has_many :answers
  has_many :replies
  has_many :comments, as: :commentable
  has_many :follows, as: :followable
  has_many :votes, as: :voteable

  def name
    [first_name, last_name].join(' ')
  end
end
