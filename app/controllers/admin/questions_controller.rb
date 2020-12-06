# frozen_string_literal: true

class Admin::QuestionsController < Admin::BaseController
  skip_before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[show destroy edit update]

  def index
    @questions = @test.questions
  end

  def show
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_test_path(@question.test), notice: 'Вопрос создан'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test), notice: 'Вопрос обновлен'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test), notice: 'Вопрос удален'
  end

  private

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
