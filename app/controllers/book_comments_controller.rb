class BookCommentsController < ApplicationController
before_action :correct_user, only: [:edit,:update]
  def create
    @book=Book.find(params[:id])
    @bookcomment=BookComment.new(book_comment_params)
    @bookcomment.user_id=current_user.id
    @bookcomment.book_id=@book.id
    if @bookcomment.save
      flash[:notice]="successfully"
    redirect_to book_path(@book.id)
  else
    @newbook=Book.new
    @bookcomments=@book.book_comments
    @user=User.find_by(id:@book.user_id)
    render template: "books/show"
  end
  end

  def edit
    @book=Book.find(params[:book_id])
    @bookcomment=BookComment.find(params[:id])
  end

  def update
    @book=Book.find(params[:book_id])
    @bookcomment=BookComment.find(params[:id])
    @bookcomment.update(book_comment_params)
    redirect_to book_path(@book)
  end

  def destroy
    @book=Book.find(params[:book_id])
    @bookcomment=BookComment.find(params[:id])
    @bookcomment.destroy
    redirect_to book_path(@book)
  end
private
def book_comment_params
  params.require(:book_comment).permit(:comment)
end
  def correct_user
    book=Book.find(params[:book_id])
    bookcomment=BookComment.find(params[:id])
    if current_user!=bookcomment.user
      redirect_to book_path(book.id)
    end
  end
end
