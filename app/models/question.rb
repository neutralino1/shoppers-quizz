class Question < ActiveRecord::Base

  has_many :answers, -> { order('RAND()') }, dependent: :destroy
  has_many :question_users, dependent: :destroy
end