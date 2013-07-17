# -*- coding: utf-8 -*-
class TheadersController < ApplicationController
  before_action :set_theader, only: [:show, :edit, :update, :destroy]
  # reference the helper
  include TheadersHelper
  # GET /theaders
  # GET /theaders.json
  def index
    @theaders = Theader.all
  end

  # GET /theaders/1
  # GET /theaders/1.json
  def show
    @tvalue = @theader.TValues.build
    render :layout => 'middle_max' 
  end

  # GET /theaders/new
  def new
    # 用户存在
    @url = offices_path
    if session[:user]
      @theader = Theader.new
      @theader.user_id = session[:user].id
      respond_to {|format| format.html { render :layout =>'middle_max'}}
    # 用户不存在则跳转到首页
    else
      redirect_to root_path
    end
  end

  # GET /theaders/1/edit
  def edit
    @url = office_path(@theader)
  end

  # POST /theaders
  # POST /theaders.json
  def create
    @theader = Theader.new(theader_params)
    # @theader.length = MyExcel.items_length(@theader.items)
    # split the space
    @theader.items = @theader.items.strip
    if MyExcel.items_length(@theader.items)==0
      redirect_to new_office_path,notice:' 亲～，没有填写表格选项奥'
      return
      # else
      # redirect_to office_url(@theader)
    end
    respond_to do |format|
      if @theader.save
        format.html { redirect_to office_url(@theader), notice: @theader.title+"创建完成" }
        format.json { render action: 'show', status: :created, location: @theader }
      else
        format.html { render action: 'new' }
        format.json { render json: @theader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /theaders/1
  # PATCH/PUT /theaders/1.json
  def update
    respond_to do |format|
      if @theader.update(theader_params)
        format.html { redirect_to office_path(@theader), notice: 'Theader was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @theader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /theaders/1
  # DELETE /theaders/1.json
  def destroy
    @theader.destroy
    respond_to do |format|
      format.html { redirect_to offices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theader
      @theader = Theader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def theader_params
      params.require(:theader).permit(:user_id, :direction, :title, :_title, :heads, :items, :length, :intro, :type)
    end
end
