# frozen_string_literal: true

class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new; end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to test_path(@test), notice: 'Тест создан'
    else
      render :new
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author)
  end
end
