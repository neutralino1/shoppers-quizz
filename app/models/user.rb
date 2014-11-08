class User < ActiveRecord::Base

  MAX_TIME = 12.seconds

  has_and_belongs_to_many :questions
  has_many :question_users, dependent: :destroy
  
  def start_quizz!
    update_attribute(:started_at, started_at || Time.now)
  end

  def finish_quizz!
    self.finished_at = Time.now
    self.succeeded = succeeded_quizz?
    save!
  end

  def has_started_quizz?
    !!started_at
  end

  def has_finished_quizz?
    !!finished_at
  end

  def succeeded_quizz?
    has_finished_quizz? and time_to_complete < MAX_TIME and question_users.correct.count == Question.count
  end

  def time_left
    (MAX_TIME - (Time.now - started_at)).to_i
  end

  def over_time?
    has_started_quizz? and time_left <= 0
  end

  def time_to_complete
    return unless has_finished_quizz?
    (finished_at - started_at).to_i
  end
end