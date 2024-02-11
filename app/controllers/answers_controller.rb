class AnswersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @answers = Answer.all
    render json: @answers
  end


  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      render json: @answer, status: :created
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id, :user_id)
  end
end
