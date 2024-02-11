# app/controllers/questions_controller.rb
class QuestionsController < ApplicationController
    before_action :set_question, only: [:show, :update, :destroy]
  
    # GET /questions
    
    def index

      @questions = Question.all
      render json: @questions
    end
  
    # GET /questions/:id
    def show
      render json: @question
    end
  
    # POST /questions
    def create
      @question = current_user.questions.new(question_params)
      if @question.save
        render json: @question, status: :created
      else
        render json: @question.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /questions/:id
    def update
      if @question.update(question_params)
        render json: @question
      else
        render json: @question.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /questions/:id
    def destroy
      @question.destroy
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:title, :content, :location)
    end
  end
  