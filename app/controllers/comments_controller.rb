class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    if current_user.comments.create(comment_params)
      flash[:notice] = "OK"
    else
      flash[:error] = "NG"
    end
    redirect_to product_path(comment_params[:product_id])
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "修正されました"
      redirect_to product_path(@comment.product_id)
    else
      flash[:error] = "修正されませんでした"
      render :edit
    end
  end

  def destroy
    if @comment.destroy
      flash[:notice] = "削除できました"
    else
      flash[:error] = "削除できませんでした"
    end
    redirect_to product_path(@comment.product_id)
  end

  protected

    def comment_params
      params.require(:comment).permit(:content, :product_id)
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end
end