require 'rails_helper'

RSpec.describe BooksController, type: :controller do

	let(:book)        {create(:book)}
	let(:publication) {create(:publication)}
	let(:author) 			{create(:author)}
	let(:shop) 				{create(:shop)}
	let(:category) 		{create(:category)}

	describe "GET #index" do
		it "render to index page" do
			get :index
			expect(response).to render_template("index")
		end
	end

	describe "GET #show" do
		before do 
      get :show, params: {id: book.id}
    end
	  it "show book" do
	    expect(assigns(:book)).to eq(book)
	  end
	  
	  it "renders the #show view" do
	    expect(response).to render_template("show")
	  end
	end

	describe "GET #new" do
    before do 
      get :new
    end
    it 'New Book' do
      expect(assigns(:book)).to be_a_new(Book)
    end

    it 'renders new views' do
      expect(response).to render_template :new 
    end
  end

  describe "GET #edit" do
    before do
      get :edit, params: {id: book.id}
    end
    it 'edit book' do
      expect(assigns(:book)).to eq book
    end
    it 'render edit view' do
      expect(response).to render_template :edit
    end 
  end

  describe "POST #create" do
    context "with valid attributes" do
      it 'saves the book in the database' do 
        expect {post :create, params: {book: attributes_for(:book, publication_id: publication.id, books_authors: attributes_for(:author), books_categories: attributes_for(:category), books_shops: attributes_for(:shop))}}.to change(Book, :count).by(1) 
      end 
      it 'redirect to show view' do
      	post :create, params: {book: attributes_for(:book, publication_id: publication.id, books_authors: attributes_for(:author), books_categories: attributes_for(:category), books_shops: attributes_for(:shop))}
        expect(response).to redirect_to Book.last
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it 'saves the book in the database' do 
        put :update, params: {id: book.id, book: attributes_for(:book, title: "updated abcd", publication_id: publication.id, books_authors: attributes_for(:author), books_categories: attributes_for(:category), books_shops: attributes_for(:shop))}
        book.reload
        expect(book.title).to eq("updated abcd")
      end 
      it 'redirect to updated book' do
      	put :update, params: {id: book.id, book: attributes_for(:book, publication_id: publication.id, books_authors: attributes_for(:author), books_categories: attributes_for(:category), books_shops: attributes_for(:shop))}
        expect(response).to redirect_to book
      end
    end
  end 

end
