require 'test_helper'

class BookIssuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_issue = book_issues(:one)
  end

  test "should get index" do
    get book_issues_url
    assert_response :success
  end

  test "should get new" do
    get new_book_issue_url
    assert_response :success
  end

  test "should create book_issue" do
    assert_difference('BookIssue.count') do
      post book_issues_url, params: { book_issue: { issue_date: @book_issue.issue_date, return_date: @book_issue.return_date } }
    end

    assert_redirected_to book_issue_url(BookIssue.last)
  end

  test "should show book_issue" do
    get book_issue_url(@book_issue)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_issue_url(@book_issue)
    assert_response :success
  end

  test "should update book_issue" do
    patch book_issue_url(@book_issue), params: { book_issue: { issue_date: @book_issue.issue_date, return_date: @book_issue.return_date } }
    assert_redirected_to book_issue_url(@book_issue)
  end

  test "should destroy book_issue" do
    assert_difference('BookIssue.count', -1) do
      delete book_issue_url(@book_issue)
    end

    assert_redirected_to book_issues_url
  end
end
