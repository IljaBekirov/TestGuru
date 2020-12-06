# frozen_string_literal: true

class Admin::AnswersController < Admin::BaseController
  skip_before_action :authenticate_user!
  before_action :find_question, only: %i[new create]
  before_action :find_answer, only: %i[show destroy edit update]

  def new
    @answer = Answer.new
  end

  def show; end

  def index; end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to admin_question_path(@answer.question), notice: 'Ответ создан'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @answer.update(answer_params)
      redirect_to admin_question_path(@answer.question), notice: 'Ответ обновлен'
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to admin_question_path(@answer.question), notice: 'Ответ удален'
  end

  private

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
