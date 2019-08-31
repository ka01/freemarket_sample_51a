require 'rails_helper'

describe SignupController, type: :controller do

  describe 'GET #step1' do
    it "ステップ1に遷移" do
      get :step1
      expect(response).to render_template :step1

    end
  end
  # describe 'GET #step2' do
  #   it "assigns the requested tweet to @tweet" do
  #     user = create(:user)
  #     get :user, params: { id: user }
  #     expect(assigns(:user)).to eq user
  #   end

  #   it "renders the :edit template" do
  #   end
  # end
end
