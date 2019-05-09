require "rails_helper"
RSpec.describe UsersController, type: :controller do
  describe "before action" do
    it {is_expected.to use_before_action(:set_user)}
    it {is_expected.to use_before_action(:logged_in_user)}
  end
  before {
    @role = Role.create(id: 1, name: "normal")
    @role2 = Role.create(id: 2, name: "moderator")
  }

  describe "POST users#create" do
    context "with valid attributes" do
      it "creates a new user" do
        expect {
          post :create, params: {user: FactoryBot.attributes_for(:user)}
        }.to change(User, :count).by(1)
      end

      it "redirects to the new follow" do
        post :create, params: {user: FactoryBot.attributes_for(:user)}
        expect(response).to redirect_to new_user_follow_path(User.last)
      end
    end

    context "with invalid attributes" do
      it "does not save a new user" do
        expect {
          post :create, params: {user: FactoryBot.attributes_for(:invalid_user)}
        }.not_to change(User, :count)
      end

      it "re-renders to the new method" do
        post :create, params: {user: FactoryBot.attributes_for(:invalid_user)}
        expect(response).to render_template :new
      end
    end
  end

  describe "GET users#show" do
    let(:user) {FactoryBot.create :user}
    context "with valid show" do
      before :each do
        session[:user_id] = user.id
        get :show, params: {id: user.id}
      end
      it "assigns the requested user to @user" do
        expect(response).to have_http_status(:ok)
      end
      it "renders to the #show view" do
        expect(response).to render_template :show
      end
    end
    context "with invalid show" do
      before {
        get :show, params: {id: user.id}
      }
      it {is_expected.to set_flash[:danger].to("Please log in")}
      it "renders to the root view" do
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "GET users#edit" do
    before {
      @user = FactoryBot.create(:user)
      @user1 = FactoryBot.create(:user1)
    }
    it "located the requested @user" do
      get :edit, params: {id: @user.id, user: FactoryBot.attributes_for(:user)}
      expect(assigns(:user)).to eq(@user)
    end

    it "edit role_id from 1 to 2" do
      get :edit, params: {id: @user.id, user: FactoryBot.attributes_for(:user,
        role_id: 2)}
      @user.reload
      expect(@user.role_id).to eq(2)
    end

    it "edit role_id from 2 to 1" do
      get :edit, params: {id: @user1.id, user1: FactoryBot.attributes_for(:user1,
        role_id: 1)}
      @user1.reload
      expect(@user1.role_id).to eq(1)
    end

    it "renders to the admin view" do
      get :edit, params: {id: @user.id}
      expect(response).to redirect_to admin_path
    end
  end

  describe "PUT users#update" do
    before {
      @user = FactoryBot.create(:user)
    }
    context "with valid attributes" do
      it "located the requested @user" do
        put :update, params: {id: @user.id, user: FactoryBot.attributes_for(:user)}
        expect(assigns(:user)).to eq @user
      end
      it "changes @user's attributes" do
        put :update, params: {id: @user.id, user: FactoryBot.attributes_for(:user,
          name: "vuvanquy", email: "vuvanquy@gmail.com", password: "foobar",
          password_confirmation: "foobar")}
        @user.reload
        expect(@user.name).to eq("vuvanquy")
        expect(@user.email).to eq("vuvanquy@gmail.com")
      end
      it "renders to the @user view" do
        put :update, params: {id: @user.id, user: FactoryBot.attributes_for(:user)}
        is_expected.to set_flash[:success].to("Profile updated")
        expect(response).to redirect_to @user
      end
    end
    
    context "with invalid attributes" do
      it "located the requested @user" do
        put :update, params: {id: @user.id, user: FactoryBot.attributes_for(:invalid_user)}
        expect(assigns(:user)).to eq @user
      end
      it "does not change @user's attributes" do
        put :update, params: {id: @user.id, user: FactoryBot.attributes_for(:user,
          name: "", email: "vuvanquy123@gmail.com", password: "",
          password_confirmation: "123456")}
        @user.reload
        expect(@user.name).not_to eq("")
        expect(@user.email).not_to eq("vuvanquy123@gmail.com")
      end
      it "re-renders to the @user view" do
        put :update, params: {id: @user.id, user: FactoryBot.attributes_for(:invalid_user)}
        is_expected.to set_flash[:danger].to("Update fail")
        expect(response).to redirect_to @user
      end
    end
  end
end