# frozen_string_literal: true

class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  before_action :find_test, only: %i[index new create show]
  before_action :find_question, only: %i[show destroy]

  def index
    @questions = @test.questions
  end

  def show
    @question = @test.questions.find(params[:id])
  end

  def new; end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_questions_path, notice: 'Вопрос создан'
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path, notice: 'Вопрос удален'
  end

  private

  def rescue_with_test_not_found
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
