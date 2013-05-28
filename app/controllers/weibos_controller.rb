# -*- coding: utf-8 -*-
class WeibosController < ApplicationController
  before_action :set_weibo, only: [:show, :edit, :update, :destroy]

  #== 特定用户的微博页面
  #* GET /weibos/:id/userspace
  def userspace
    @weibo = Weibo.new
    @weibos = Weibo.where("user_id ="+params[:id].to_s)
    render :index
  end
  
  #== the first web page of weibo
  #* GET /weibos
  #* GET /weibos.json
  def index    
    # Notifier.amend_password.deliver
    # the param in _form.erb.html
    @weibo = Weibo.new
    # all of the msg in db
    if session[:user]
      sql_condition = "user_id in ("+session[:user].id.to_s
      friends =  UserConfig.find_by_user_id(session[:user].id).friends
      if friends
          friends.split.each { |item| sql_condition += ","+item }
      end
      @weibos = Weibo.where(sql_condition + ")")
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
    if session[:user]
      @weibo.user_id = session[:user].id
    end
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
