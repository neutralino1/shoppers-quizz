class QuestionUser < ActiveRecord::Base

  belongs_to :user
  belongs_to :question
  belongs_to :answer

  scope :correct, -> { joins(:answer).where(answers: {correct: true}) }

  validates :answer, presence: true
end