class HomePagesController < ApplicationController
  
  def index
    if params[:book_id].present? || params[:isbn_no].present? || params[:year].present? || params[:author_id].present? || params[:publication_id].present? || params[:category_id].present? 
      book_title = Book.find_by_id(params[:book_id]).title if params[:book_id].present?
      @books = Book.joins(:authors, :categories).where("isbn_no LIKE ? AND YEAR(publish_date) LIKE ? AND publication_id LIKE ? AND books_authors.author_id LIKE ? AND books_categories.category_id LIKE ?", "%#{params[:isbn_no]}%", "%#{params[:year]}%", "%#{params[:publication_id]}%", "%#{params[:author_id]}%", "%#{params[:category_id]}%").order(:title).page(params[:page]).per(3)
      @year           = params[:year]
      @publication_id = params[:publication_id]
      @category       = params[:category_id]
      @author         = params[:author_id]
      @book           = params[:book_id]
    else
      @books = Book.order(:title).page(params[:page]).per(3)
    end
    if params[:email].present? 
      UserMailer.with(user: params[:email]).book_detail.deliver_later
    end
  end

  def select_author
    book = Book.find(params[:book_id])
    data = Author.joins(:books).where("books_authors.book_id in (?)",book.id).select(:id, :name)
    render json: data
  end

end
