class TheadersController < ApplicationController
  before_action :set_theader, only: [:show, :edit, :update, :destroy]

  # GET /theaders
  # GET /theaders.json
  def index
    @theaders = Theader.all
  end

  # GET /theaders/1
  # GET /theaders/1.json
  def show
  end

  # GET /theaders/new
  def new
    @theader = Theader.new
  end

  # GET /theaders/1/edit
  def edit
  end

  # POST /theaders
  # POST /theaders.json
  def create
    @theader = Theader.new(theader_params)

    respond_to do |format|
      if @theader.save
        format.html { redirect_to @theader, notice: 'Theader was successfully created.' }
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
        format.html { redirect_to @theader, notice: 'Theader was successfully updated.' }
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
      format.html { redirect_to theaders_url }
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
