class BookIssuesController < ApplicationController
  before_action :set_book_issue, only: [:show, :edit, :update, :destroy]

  # GET /book_issues
  # GET /book_issues.json
  def index
    @book_issues = BookIssue.all
  end

  # GET /book_issues/1
  # GET /book_issues/1.json
  def show
  end

  # GET /book_issues/new
  def new
    @book_issue = BookIssue.new
  end

  # GET /book_issues/1/edit
  def edit
  end

  # POST /book_issues
  # POST /book_issues.json
  def create
    @book_issue = BookIssue.new(book_issue_params)

    respond_to do |format|
      if @book_issue.save
        format.html { redirect_to @book_issue, notice: 'Book issue was successfully created.' }
        format.json { render :show, status: :created, location: @book_issue }
      else
        format.html { render :new }
        format.json { render json: @book_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_issues/1
  # PATCH/PUT /book_issues/1.json
  def update
    respond_to do |format|
      if @book_issue.update(book_issue_params)
        format.html { redirect_to @book_issue, notice: 'Book issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_issue }
      else
        format.html { render :edit }
        format.json { render json: @book_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_issues/1
  # DELETE /book_issues/1.json
  def destroy
    @book_issue.destroy
    respond_to do |format|
      format.html { redirect_to book_issues_url, notice: 'Book issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_issue
      @book_issue = BookIssue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_issue_params
      params.require(:book_issue).permit(:book_id, :user_id, :librarian_id,:issue_date, :return_date)
    end
end
