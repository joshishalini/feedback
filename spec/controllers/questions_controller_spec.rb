# frozen_string_literal: true

require "rails_helper"

RSpec.describe QuestionsController, type: :controller do

  describe "GET #all_questions" do

	  before do
			get :all_questions, format: :json
	  end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "responds with an Array" do
      expect(JSON.parse(response.body)).to be_kind_of(Array)
    end

    it "responds with the array of Questions" do
      parsed = JSON.parse(response.body)

      expect(parsed.count).to_not be_nil
    end
  end


  describe "GET #all_questions" do

	  before do
			get :all_questions, format: :json
	  end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "responds with an Array" do
      expect(JSON.parse(response.body)).to be_kind_of(Array)
    end

    it "responds with the array of Questions" do
      parsed = JSON.parse(response.body)

      expect(parsed.count).to_not be_nil
    end
  end


  describe "GET #enabled_questions" do

	  before do
			get :enabled_questions, format: :json
	  end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "responds with an Array" do
      expect(JSON.parse(response.body)).to be_kind_of(Array)
    end

    it "responds with the array of Questions" do
      parsed = JSON.parse(response.body)

      expect(parsed.count).to_not be_nil
    end

    it "All should be enabled" do
      parsed = JSON.parse(response.body)
      parsed_question = parsed[0].with_indifferent_access

      enabled_question = parsed_question.fetch(:enabled)
      expect(enabled_question).to eq true
  	end
  end

  describe "GET #find_by_id" do

	  before do
			get :find_by_id, params: {id: "1"}, format: :json
	  end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "Id will be equal to passes one" do
      parsed = JSON.parse(response.body)
      parsed_question = parsed[0].with_indifferent_access

      question = parsed_question.fetch(:id)
      expect(question).to eq '1'
  	end
  end
end
