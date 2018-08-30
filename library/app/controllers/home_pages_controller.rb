class HomePagesController < ApplicationController
  def index
    conditions = {}
    conditions[:publish_date]                   = params[:year] if params[:year].present?
    conditions[:isbn_no]                        = params[:isbn_no] if params[:isbn_no].present?
    conditions[:id]                             = params[:book_id] if params[:book_id].present?
    conditions[:publication_id]                 = params[:publication_id] if params[:publication_id].present?
    conditions[:"books_categories.category_id"] = params[:category_id] if params[:category_id].present?
    @books = Book.joins(:categories).where(conditions).order(:title).page(params[:page]).per(3)
    @year           = params[:year]
    @publication_id = params[:publication_id]
    @category       = params[:category_id]
    @author         = params[:author_id]
    @book           = params[:book_id]
    if params[:email].present? 
      UserMailer.with(user: params[:email]).book_detail.deliver_later
    end
  end

  def select_author
    book = Book.find(params[:book_id])
    data = Author.joins(:books).where("books_authors.book_id in (?)",book.id).select(:id, :name)
    render json: data
  end

  def references
    references = Book.where('isbn_no LIKE ?', "%#{params[:term]}%").pluck(:isbn_no)
    render json: references, status: :ok
  end
end