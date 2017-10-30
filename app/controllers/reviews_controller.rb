class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_movie
  before_action :authenticate_user!

  def new
    @review = current_user.reviews.new
  end

  def edit
  end

  def create
    @review = current_user.reviews.new(review_params)
    @review.movie_id = @movie.id
    respond_to do |format|
      if @review.save
        format.html { redirect_to @movie, notice: 'Review was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_review
      @review = current_user.reviews.find(params[:id])
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
