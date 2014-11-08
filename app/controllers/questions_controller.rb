class QuestionsController < ConnectedController

  def next
    redirect_to root_path and return if @current_user.over_time?
    question = Question.select(:id).joins("LEFT JOIN question_users ON question_users.question_id = questions.id AND question_users.user_id = #{@current_user.id}").where("question_users.id IS NULL").order('RAND()').select(:id).first
    if question
      redirect_to question
    else
      @current_user.finish_quizz!
      redirect_to root_path
    end
  end

  def show
    @question = Question.find(params[:id])
    @question_user = @current_user.question_users.build(question: @question)
    @current_user.start_quizz!
  end
end