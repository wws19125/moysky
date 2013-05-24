# -*- coding: utf-8 -*-
class Userspace::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  include MsgHelper
  include RandomHelper
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end
  
  # POST follow 关注
  def follow
    
  end

  
  # DELETE unfollow 取消关注
  def unfollow
    
  end
  
  # post /users/logon
  def logon
    @msg = JMsg.new(0)
    respond_to do |format|
      if @user=User.find_by_dname_and_password(params[:dname],params[:password])
        session[:user] = @user
        @msg.msg = "ok"
        format.json { render 'shared/_msg',:locals => {:msg => @msg } }
      else
        @msg.code = 1
        @msg.msg = "error"
        format.json { render 'shared/_msg',:locals => {:msg => @msg } }
      end
    end
  end

  # post /users/logout
  def logout
    session[:user]=nil
    reset_session
    # goto the logout page
    respond_to do |format|      
      format.html { redirect_to root_path }
    end
  end
  
  # Get forget the password
  # Post send the email
  def forget_password
    email = params[:email]
    respond_to do |format|
      if !email
        format.html { render :layout => 'tmb_frame',:locals => { :title => '使用邮箱找回密码' } }
      else
        if user = User.find_by_email(email)
          code = MyRandom.long_random_number_and_char 32
          if FindPassword.create(:email => email,:last_time => ( Time.now + 2.day ),:code => code ) && Notifier.amend_password(email,user.dname,find_password_userspace_users_url+"/"+code+"/"+email).deliver
            msg = JMsg.new 0
            msg.msg = "ok"
            msg.html = "我们已经向"+email+"发送电子邮件,请注意查收"
            format.json { render 'shared/_msg',:locals => {:msg  => msg } }
          else
            msg = JMsg.new 1
            msg.msg = "服务端出问题了，不知道怎么搞的"
            format.json { render 'shared/_msg',:locals => {:msg => msg } }
          end
        else
          msg = JMsg.new 1
          msg.msg = "额，这个邮箱还没有被注册"
          # @msg.
          format.json { render 'shared/_msg',:locals => {:msg=>msg }}
        end
      end
    end
  end

  # GET find the password
  def find_password_page
    if fp = FindPassword.find_by_email_and_code(params[:email],params[:key])
      render :layout => 'tmb_frame',:locals => { :title => '重置密码',:id=>fp.id }
    else
      redirect_to root_url
    end
  end

  # POST update the password
  def find_password
    user = User.find_by_email params[:email]
    respond_to do |format|
      if user.update_attribute(:password,params[:password])
        format.html { render :text => "ok" }
      else
        format.html { render :text => "error" }
      end
    end
  end

  def password_sendmail    
    @msg = JMsg.new 0
    respond_to do |format|
      if !params[:email] #&&!params["code"] 
        @msg.msg = "ok"
        @msg.html = "<a>我们已经向"+params[:email]+"发送电子邮件</a>"
        format.json { render 'shared/msg',:locals => { :msg => @msg } }      
      else
        @msg.msg = "error"
        format.json { render 'shared/msg',:locals => { :msg => @msg } }      
      end
    end
  end

  # update password
  def update_password
    # find the current user
    @user = User.find session[:user].id
    respond_to do |format|
      if @user.update_attribute :password, params[:password]
        
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end
 
  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:passport, :dname, :password, :config)
    end
end
