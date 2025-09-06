class GenresController < ApplicationController
  def index
    @genres = Genre.all
      if params[:search] == nil
        @genre= Genre.all
      elsif params[:search] == ''
        @genre= Genre.all
      else
        #部分検索
        @genre = Genre.where("body LIKE ? ",'%' + params[:search] + '%')
      end
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to @genre, notice: '投稿が作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to @genre, notice: '投稿が更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to genres_path, notice: '投稿を削除しました。'
  end

  private

  def genre_params
    params.require(:genre).permit(:title, :genre, :image, :link)
  end
end