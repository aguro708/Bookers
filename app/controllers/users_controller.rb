class UsersController < ApplicationController
before_action :correct_user, only: [:edit,:update]
	def index
		@user=current_user
		@users=User.all
		@book=Book.new
	end
	def show
		@user=User.find(params[:id])
		@book=Book.new
		@books=@user.books
	end
	def following
		@user=User.find(params[:id])
		@users=@user.following
		render 'show_follow'
	end
	def followers
		@user=User.find(params[:id])
		@users=@user.followers
		render 'show_follower'
	end
	def edit
		@user=User.find(params[:id])
	end
	def update
		@user=User.find(params[:id])
		if @user.update(user_params)
			flash[:notice]="successfully"
		redirect_to user_path(@user)
	else
		flash[:notice]="error"
		render "edit"
	end
	end
	def search
		@user_or_book=params[:option]
		@how_search=params[:choice]
		if @user_or_book=="1"
			@users=User.search(params[:search], @user_or_book, @how_search)
		else
			@books=Book.search(params[:search], @user_or_book, @how_search)
		end
	end
	private
	def user_params
		params.require(:user).permit(:name,:profile_image,:introduction)
	end
	def correct_user
		user=User.find(params[:id])
		if current_user!=user
			redirect_to mypage_path(current_user)
		end
	end
end
