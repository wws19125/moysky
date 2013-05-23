# -*- coding: utf-8 -*-
class WeibosController < ApplicationController
  before_action :set_weibo, only: [:show, :edit, :update, :destroy]

  #== the first web page of weibo
  #* GET /weibos
  #* GET /weibos.json
  def index    
    # Notifier.amend_password.deliver
    # the param in _form.erb.html
    @weibo = Weibo.new
    # all of the msg in db
    if session[:user]
      @weibos = Weibo.where("user_id="+session[:user].id.to_s)
    else
      @weibos = Weibo.all
    end
  end

  # GET /weibos/1
  # GET /weibos/1.json
  def show
    respond_to do |f|
      f.html { redirect_to weibos_path }
    end
  end

  # GET /weibos/new
  def new
    @weibo = Weibo.new
  end

  # GET /weibos/1/edit
  def edit
    respond_to do |f|
      f.html { redirect_to weibos_path }
    end
  end

  # POST /weibos
  # POST /weibos.json
  def create
    # receive the :body from client only
    @weibo = Weibo.new(weibo_params)
    # modify the other info
    @weibo.created_at = Time.now
    
    respond_to do |format|
      if @weibo.save
        format.html { render @weibo }
        format.json { render action: 'show', status: :created, location: @weibo }
      else
        format.html { render action: 'new' }
        format.json { render json: @weibo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weibos/1
  # PATCH/PUT /weibos/1.json
  def update
    respond_to do |format|
      if @weibo.update_attribute("thumbs_count",@weibo.thumbs_count+1)
        format.html { render :text=>@weibo.thumbs_count }
      else
        format.html { render :status=>500,:nothing => true }
      end
    end
  end

  # DELETE /weibos/1
  # DELETE /weibos/1.json
  def destroy
    Comment.destroy_all("weibo_id="+@weibo.id.to_s)
    @weibo.destroy
    respond_to do |format|
      format.html { render :text=>'ok' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weibo
      @weibo = Weibo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weibo_params
      params.require(:weibo).permit(:weiboid, :userid, :body, :pid, :btype)
    end
end
