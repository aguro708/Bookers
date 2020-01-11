class BooksController < ApplicationController
	before_action :correct_user, only: [:edit,:update]
		def index
		@books=Book.all
		@user=current_user
		@book=Book.new
	end
	def show
		@book=Book.find(params[:id])
		@user=User.find_by(id:@book.user_id)
		@newbook=Book.new
		@bookcomments=@book.book_comments
		@bookcomment=BookComment.new
		@favorites=@book.favorites
	end
	def create
		@book=Book.new(book_params)
		@book.user_id=current_user.id
	    if @book.save
	    	respond_to do |format|
	    		format.html {redirect_to books_path ,notice: 'successfully'}
	    		format.json
	    	end
	    end
	end
	def edit
		@book=Book.find(params[:id])
	end
	def update
		@book=Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice]="successfully"
		redirect_to book_path(@book.id)
	else
		flash[:notice]="error"
		render "edit"
	end
end
	def destroy
		@book=Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end
	private
	def book_params
		params.require(:book).permit(:title,:body)
	end
	def correct_user
		book=Book.find(params[:id])
		user=book.user
		if current_user!=user
			redirect_to books_path
		end
	end
end
