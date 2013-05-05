class CommentsController < ApplicationController

  #GET
  def new
    @weibo = Weibo.find(params[:id])
    respond_to do |format|
      format.html { render :partial=>'comments',:locals=>{:weibo=>@weibo}}
    end
  end

  def destroy
    
  end

  def create
    @comment = Comment.new(comment_params);
    respond_to do |format|
      if @comment.save
        format.html { render :nothing=>true,:status => 200 }
      else
        format.html { render :nothing=>true,:status=>500 }
      end
    end
  end
  
  #helper
  private
  
  def comment_params
      params.require(:comment).permit(:weibo_id, :body, :pid)
    end

end
