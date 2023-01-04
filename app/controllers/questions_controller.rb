class QuestionsController < ApplicationController
  def index
    @q = Question.ransack(params[:q])
    @question = @q.result(distinct: true)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params.merge(user_id: current_user.id))

    if @question.save!
      redirect_to users_path, notice: "質問を投稿しました。"
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update!(question_params)
    redirect_to question_path 
    flash[:notice] = "質問「#{@question.title}」 を更新しました。"
  end

  def solve
    @question = Question.find(params[:id])
    @question.update!(solved_check: true)
    redirect_to question_path(@question)
  end
  
  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

end