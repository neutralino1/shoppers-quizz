class QuestionUsersController < ConnectedController

  def create
    @question = Question.find(params[:question_id])
    @question_user = @current_user.question_users.build(question_user_params.merge(question: @question))
    if @question_user.save
      @current_user.start_quizz!
      redirect_to next_questions_path
    else
      flash[:error] = 'Please select a picture.'
      render 'questions/show'
    end
  end

  protected 

  def question_user_params
    params.require(:question_user).permit(:answer_id)
  end

end