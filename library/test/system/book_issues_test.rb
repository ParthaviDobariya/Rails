require "application_system_test_case"

class BookIssuesTest < ApplicationSystemTestCase
  setup do
    @book_issue = book_issues(:one)
  end

  test "visiting the index" do
    visit book_issues_url
    assert_selector "h1", text: "Book Issues"
  end

  test "creating a Book issue" do
    visit book_issues_url
    click_on "New Book Issue"

    fill_in "Issue Date", with: @book_issue.issue_date
    fill_in "Return Date", with: @book_issue.return_date
    click_on "Create Book issue"

    assert_text "Book issue was successfully created"
    click_on "Back"
  end

  test "updating a Book issue" do
    visit book_issues_url
    click_on "Edit", match: :first

    fill_in "Issue Date", with: @book_issue.issue_date
    fill_in "Return Date", with: @book_issue.return_date
    click_on "Update Book issue"

    assert_text "Book issue was successfully updated"
    click_on "Back"
  end

  test "destroying a Book issue" do
    visit book_issues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book issue was successfully destroyed"
  end
end
