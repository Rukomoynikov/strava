require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GET /home" do
    it "should render a correcet template" do
      get :home
      expect(response).to render_template("home")
    end
  end
end
