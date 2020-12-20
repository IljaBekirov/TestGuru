# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    if @test.questions.blank?
      redirect_to root_path, alert: t('.error')
      return
    end

    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test), notice: t('.success')
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
