# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to tests_path
    else
      render :edit
    end
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to tests_path, notice: 'Тест создан'
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path, notice: 'Тест удален'
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author)
  end
end
