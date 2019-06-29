require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'grams#create action'
    it "should allow users to create comments on grams" do
      gram = Factorybot.create(:gram)
      sign_in user

      post :create, params: { gram_id: gram.id, comment: { message: "awesome gram" } }

      expect(response).to redirect_to root_path
      expect(gram.comments.length).to eq 1
      expect(gram.comment.first.message).to eq "awesome gram"
    end 

    it "should require a user to be logged in to comment on a gram" do 
      gram = Factorybot.create(:gram)

      post :create, params: { gram_id: gram.id, comment: { message: "awesome gram" } }
      expect(response).to redirect_to new_user_session_path
    end 

    it "should return http status code of not found if the gram isn't found" do 
      user = Factorybot.create(:user)
      sign_in user

      post :create, params: { gram_id: 'YOLOSWAG', comment: { message: "awesome gram" } }
      expect(response).to have_http_status :not_found
    end 
  end 