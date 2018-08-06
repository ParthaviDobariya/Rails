class HomePagesController < ApplicationController
  
  def index
  	if params[:title]
      @books = Book.where("title LIKE :name OR isbn_no LIKE :name OR YEAR(publish_date) LIKE :name OR pages LIKE :name", name: "%#{params[:title]}%").order(:title).page(params[:page]).per(3)
    else
      @books = Book.order(:title).page(params[:page]).per(3)
    end
  end

	private
    # Never trust parameters from the scary internet, only allow the white list through.
    def home_page_params
      params.require(:home_page).permit(:title, :selected)
    end

end
