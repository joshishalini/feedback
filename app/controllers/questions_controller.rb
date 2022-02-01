class QuestionsController < ApplicationController

	before_action :read_questions

	# GET    /questions/all_questions
	def all_questions
		render json: @questions
	end

	# GET /questions/enabled_questions
	def enabled_questions
		render json: @questions.select { |a| a["enabled"] == true }
	end

	# GET /questions/:id/find_by_id
	def find_by_id
		render json: @questions.select { |a| a["id"] == params[:id] }
	end

	private

	def read_questions
		@questions = JSON.parse(File.read('public/questions.json'))
	end
end
