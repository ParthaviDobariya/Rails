class HomePagesController < ApplicationController
  
  def index
  	if params[:title].present? || params[:isbn_no].present? || params[:year].present? || params[:author].present? || params[:publication_id].present? || params[:category_id].present? 
      @books = Book.joins(:authors, :categories).where("title LIKE ? AND isbn_no LIKE ? AND YEAR(publish_date) LIKE ? AND publication_id LIKE ? AND authors.name LIKE ? AND books_categories.category_id LIKE ?", "%#{params[:title]}%", "%#{params[:isbn_no]}%", "%#{params[:year]}%", "%#{params[:publication_id]}%", "%#{params[:author]}%", "%#{params[:category_id]}%").order(:title).page(params[:page]).per(3)
    else
      @books = Book.order(:title).page(params[:page]).per(3)
    end
  end

	private
    # Never trust parameters from the scary internet, only allow the white list through.
    def home_page_params
      params.require(:home_page).permit(:title, :isbn_no, :year, :publication_id,:author, :category_id, :selected)
    end

end
