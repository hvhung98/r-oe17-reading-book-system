require "rails_helper"
RSpec.describe BooksController, type: :controller do
  let(:category) {FactoryBot.create(:category)}
  before :each do
    @role = Role.create(id: 1, name: "normal")
    @role2 = Role.create(id: 2, name: "moderator")
    @author = Author.create(id: 1, name: "Nguyen Nhat Anh")
    @user = User.create(id: 1, name: "hoanghung", email: "hoanghung@gmail.com",
      password: "123456", password_confirmation: "123456")
    @user2 = User.create(id: 2, name: "moderator", email: "moderator@gmail.com",
      password: "foobar", password_confirmation: "foobar", role_id: 2)
  end
  describe "before action" do
    it {is_expected.to use_before_action(:set_book)}
  end

  describe "GET books#index" do
    let(:book) {FactoryBot.create(:book, category_id: category.id)}
    before { session[:user_id] = @user.id }
    it "populates an array of books" do
      get :index
      expect(assigns(:books)).to eq([book])
    end
    it "renders to the #index view" do
      get :index
      expect(response).to render_template :index
    end
  end
  describe "POST books#create" do
    context "with valid attributes" do
      context "unpublished book" do
        before :each do
          session[:user_id] = @user.id
          post :create, params: {category_id: category.id, book: FactoryBot.attributes_for(:book),
            authors: {:id => [@author.id]}}
          @chapter = Chapter.create(book_id: Book.last.id, name: "Me rong",
            content: "Me rong rat thong minh va xinh dep")
          @history = History.create(user_id: @user.id, activity_type: "add_book",
            activity_id: Book.last.id)
          @writer = Writer.create(author_id: @author.id, book_id: Book.last.id)
        end
        it "creates a new unpublished book" do
          expect(assigns(:book)).to be_a Book
        end
        it {is_expected.to set_flash[:success].to("Thêm sách thành công")}
        it "renders to the new @book" do
          expect(response).to redirect_to [category, Book.last]
        end
      end
      context "published book" do
        before :each do
          session[:user_id] = @user2.id
          post :create, params: {category_id: category.id, book: FactoryBot.attributes_for(:book, user_id: @user2.id, status: true),
            authors: {:id => [@author.id]}}
          @chapter = Chapter.create(book_id: Book.last.id, name: "Me rong",
            content: "Me rong rat thong minh va xinh dep")
          @history = History.create(user_id: @user.id, activity_type: "add_book",
            activity_id: Book.last.id)
          @writer = Writer.create(author_id: @author.id, book_id: Book.last.id)
        end
        it "creates a new published book" do
          expect(assigns(:book)).to be_a Book
          expect(Book.last.status).to be_truthy
        end
        it {is_expected.to set_flash[:success].to("Thêm sách thành công")}
        it "renders to the new @book" do
          expect(response).to redirect_to [category, Book.last]
        end
      end
    end

    context "with invalid attributes" do
      before {session[:user_id] = @user.id}
      it "does not save a new book" do
        expect {
          post :create, params: {category_id: category.id, book: FactoryBot.attributes_for(:invalid_book), authors: {:id => [@author.id]}}
        }.not_to change(Book, :count)
      end
      it "re-render to the new view" do
        post :create, params: {category_id: category.id, book: FactoryBot.attributes_for(:invalid_book), authors: {:id => [@author.id]}}
        expect(response).to render_template :new
      end
    end
  end

  describe "GET books#show" do
    context "with book's user && status false" do
      before {session[:user_id] = @user.id}
      let(:book) {FactoryBot.create(:book, user_id: @user.id,
        category_id: category.id)}
      before {
        get :show, params: {category_id: category.id, id: book.id}
      }
      it "assigns the requested book to @book" do
        expect(response).to have_http_status(:ok)
      end
      it "renders to the #show view" do
        expect(response).to render_template :show
      end
    end
    context "with moderator rules && status false" do
      before {session[:user_id] = @user2.id}
      let(:book) {FactoryBot.create(:book, user_id: @user.id,
        category_id: category.id)}
      before {
        get :show, params: {category_id: category.id, id: book.id}
      }
      it "assigns the requested book to @book" do
        expect(response).to have_http_status(:ok)
      end
      it "renders to the #show view" do
        expect(response).to render_template :show
      end
    end
    context "with book's status is true" do
      before {session[:user_id] = @user.id}
      let(:book) {FactoryBot.create(:book, user_id: @user2.id,
        category_id: category.id, status: true)}
      before {
        get :show, params: {category_id: category.id, id: book.id}
      }
      it "assigns the requested book to @book" do
        expect(response).to have_http_status(:ok)
      end
      it "renders to the #show view" do
        expect(response).to render_template :show
      end
    end
    context "with unpublished book" do
      before {session[:user_id] = @user.id}
      let(:book) {FactoryBot.create(:book, user_id: @user2.id,
        category_id: category.id)}
      before {get :show, params: {category_id: category.id, id: book.id}}
      it "redirects to the home path" do
        expect(response).to redirect_to home_path
      end
    end
  end

  describe "PUT books#update" do
    before {session[:user_id] = @user.id}
    let(:book) {FactoryBot.create(:book, user_id: @user.id,
      category_id: category.id)}
    context "with valid attributes" do
      before {
        put :update, params: {category_id: category.id, id: book.id,
          book: FactoryBot.attributes_for(:book, name: "Pikachu",
          description: "Pokemon detective"), authors: {:id => [@author.id]}
        }
      }
      it "located the requested @book" do
        expect(assigns(:book)).to eq book
      end
      it "changes @book's attributes" do
        book.reload
        expect(book.name).to eq("Pikachu")
        expect(book.description).to eq("Pokemon detective")
      end
      it "renders to the @book view" do
        expect(response).to redirect_to [category, book]
      end
    end
    context "with invalid attributes" do
      it "located the requested @book" do
        put :update, params: {category_id: category.id, id: book.id,
          book: FactoryBot.attributes_for(:invalid_book),
          authors: {:id => [@author.id]}
        }
        expect(assigns(:book)).to eq book
      end
      it "does not change @book's attributes" do
        put :update, params: {category_id: category.id, id: book.id,
          book: FactoryBot.attributes_for(:book, name: "", description: "Rat hay"),
          authors: {:id => [@author.id]}
        }
        book.reload
        expect(book.name).not_to eq("")
        expect(book.description).not_to eq("Rat hay")
      end
      it "re-renders to the @book view" do
        put :update, params: {category_id: category.id, id: book.id,
          book: FactoryBot.attributes_for(:book, name: "", description: "Rat hay"),
          authors: {:id => [@author.id]}
        }
        is_expected.to set_flash[:danger].to("Cập nhật thất bại")
        expect(response).to redirect_to home_path
      end
    end
  end

  describe "DELETE books#destroy" do
    before {session[:user_id] = @user.id}
    let(:book) {FactoryBot.create(:book, category_id: category.id)}
    it "delete the book" do
      delete :destroy, params: {category_id: category.id, id: book.id}
      expect(response).to redirect_to home_path
    end
  end
end
