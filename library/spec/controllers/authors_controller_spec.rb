require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
	
	let(:author) {create(:author)}

	describe "GET #index" do
		it "render to index page" do
			get :index
			expect(response).to render_template("index")
		end
	end

	describe "GET #show" do
		before do 
      get :show, params: {id: author.id}
    end
	  it "show author" do
	    expect(assigns(:author)).to eq(author)
	  end
	  
	  it "renders the #show view" do
	    expect(response).to render_template("show")
	  end
	end

	describe "GET #new" do
    before do 
      get :new
    end
    it 'New Author' do
      expect(assigns(:author)).to be_a_new(Author)
    end

    it 'renders new views' do
      expect(response).to render_template :new 
    end
  end

  describe "GET #edit" do
    before do
      get :edit, params: {id: author.id}
    end
    it 'edit author' do
      expect(assigns(:author)).to eq author
    end
    it 'render edit view' do
      expect(response).to render_template :edit
    end 
  end

  describe "POST #create" do
    context "with valid attributes" do
      it 'saves the author in the database' do 
        expect {post :create, params: {author: attributes_for(:author)}}.to change(Author, :count).by(1) 
      end 
      it 'redirect to show view' do
      	post :create, params: {author: attributes_for(:author)}
        expect(response).to redirect_to Author.last
      end
    end
  end 

  describe 'PUT #update' do
	  context "valid attributes" do
	    it "changes author's attributes" do
	      put :update, params: {id: author.id, author: attributes_for(:author, name: "update abcd")}
	      author.reload
	      expect(author.name).to eq("update abcd")
	    end
	  
	    it "redirects to the updated author" do
	      put :update,params: {id: author.id, author: attributes_for(:author)}
	      expect(response).to redirect_to author
	    end
	  end
	end

	describe 'DELETE #destroy' do	  
	  it "deletes the author" do
	  	puts "========"
	  	puts params: {id: author.id}
	    expect{delete :destroy, params: {id: author.id}}.to change(Author,:count).by(-1)
	  end
	    
	  it "redirects to authors#index" do
	  	delete :destroy, params: {id: author.id}
	    expect(response).to redirect_to authors_url
	  end
	end
end