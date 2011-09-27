require 'spec_helper'

describe BooksController do

  render_views

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      response.should have_selector("title", :content => "New book")
    end
  end

  describe "GET 'show'" do

    before(:each) do
      @book = Factory(:book)
    end

    it "should be successful" do
      get :show, :id => @book
      response.should be_success
    end

    it "should have the right title" do
      get :show, :id => @book
      response.should have_selector("title", :content => @book.title)
    end
  end

  describe "POST 'create'" do

    describe "failure" do

      before(:each) do
        @attr = { :title => "",
                  :author => "",
                  :total_pages => -999,
                  :read_pages => -999 }
      end

      it "should not create a book" do
        lambda do
          post :create, :book => @attr
        end.should_not change(Book, :count)
      end

      it "should have the right title" do
        post :create, :book => @attr
        response.should have_selector("title", :content => "New book")
      end

      it "should render the 'new' page" do
        post :create, :book => @attr
        response.should render_template('new')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :title => "New Book",
                  :author => "New Author",
                  :total_pages => 300,
                  :read_pages => 0}
      end

      it "should create a book" do
        lambda do
          post :create, :book => @attr
        end.should change(Book, :count).by(1)
      end

      it "should redirect to the book show page" do
        post :create, :book => @attr
        response.should redirect_to(book_path(assigns(:book)))
      end

      it "should have successfully added book message" do
        post :create, :book => @attr
        flash[:success].should =~ /successfully added a new book/i
      end

    end

  end

end
