# -*- coding: utf-8 -*-
class CommentsController < ApplicationController

  # GET
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
    # 查找父亲
    if params[:comment_id] != nil
      @comment.comment_id = params[:comment_id]
      @pComment = Comment.find(params[:comment_id])
      @comment.weibo_id = @pComment.weibo_id
      puts @comment.weibo_id
      puts @comment.comment_id
    end
    respond_to do |format|
      if @comment.save
        format.html { render @comment }
      else
        format.html { render :nothing=>true,:status=>500 }
      end
    end
  end
  
  # helper
  private
  
  def comment_params
      params.require(:comment).permit(:weibo_id, :body, :pid)
    end

end
