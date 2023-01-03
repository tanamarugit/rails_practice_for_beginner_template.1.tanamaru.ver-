class AnswersController < ApplicationController

  def create
    @answer = current_user.answers.build(answer_params.merge(question_id: params[:question_id]))
    if @answer.save
      redirect_to question_path(params[:question_id]), success: '回答しました'
    else
      @question = @answer.question
      flash.now[:danger] = '回答の作成に失敗しました'
      render 'questions/show'
    end
  end

  def destroy
    
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end
end

