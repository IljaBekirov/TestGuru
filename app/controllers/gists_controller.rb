# frozen_string_literal: true

class GistsController < ApplicationController
  before_action :find_test_passage
  before_action :find_question
  before_action :find_gist, only: %i[create]

  def create
    client = GistQuestionService.new(@question)
    result = client.call

    client.success? ? add_gist_db(result) : flash[:alert] = t('.service_error')

    redirect_to @test_passage
  end

  private

  def add_gist_db(result)
    gist = Gist.new(user_id: current_user.id, question_id: @question.id, url: result.html_url)

    gist.save ? flash[:notice] = t('.success') : flash[:alert] = t('.failure')
  end

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end

  def find_gist
    @gist = Gist.find_by(user_id: current_user, question_id: @question)
  end

  def find_question
    @question = @test_passage.current_question
  end
end
