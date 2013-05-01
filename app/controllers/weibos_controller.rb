class WeibosController < ApplicationController
  before_action :set_weibo, only: [:show, :edit, :update, :destroy]

  #==the first web page of weibo
  #*GET /weibos
  #*GET /weibos.json
  def index
    #the param in _form.erb.html
    @weibo = Weibo.new
    #all of the msg in db
    @weibos = Weibo.all
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
    #receive the :body from client only
    @weibo = Weibo.new(weibo_params)
    #modify the other info
    @weibo.userid = 0
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
      if @weibo.update(weibo_params)
        format.html { redirect_to @weibo, notice: 'Weibo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @weibo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weibos/1
  # DELETE /weibos/1.json
  def destroy
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
