class BooksController < ApplicationController


  def new

  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      flash[:danger] = "You have created book error"
      redirect_to books_path
    else
      @books = Book.all
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end



  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
     flash[:notice] = "You have created book successfully."
     flash[:danger] = "You have created book error"
    redirect_to book_path(@book.id)
   else
    @books = Book.all
    render :edit
   end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
