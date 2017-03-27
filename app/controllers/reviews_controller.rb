class ReviewsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @group = Group.find(params[:group_id])
    @review = Review.new
  end

  def edit
    @group = Group.find(params[:group_id])
    @review = Review.find(params[:id])
  end

  def create
    @group = Group.find(params[:group_id])
    @review = Review.new(review_params)
    @review.group = @group
    @review.user = current_user

    if @review.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def update
    @group = Group.find(params[:group_id])
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to account_reviews_path, notice: "编辑成功！"
  end

  def destroy
    @group = Group.find(params[:group_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to account_reviews_path, warning: "评论已删除！"
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
