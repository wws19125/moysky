class TValuesController < ApplicationController
  before_action :set_t_value, only: [:show, :edit, :update, :destroy]
  include TValuesHelper
  # GET /t_values
  # GET /t_values.json
  def index
    @theader = Theader.find params[:office_id]
    respond_to { |f| f.json {} }
  end

  # GET /t_values/1
  # GET /t_values/1.json
  def show
  end

  # GET /t_values/new
  def new
    @t_value = TValue.new
  end

  # GET /t_values/1/edit
  def edit
  end

  # POST /t_values
  # POST /t_values.json
  def create
    # render :text => Trans.to_items(params[:items])
    # return
    @t_value = TValue.new
    @t_value.theader_id = params[:office_id]
    @t_value.items = Trans.to_items( params[:items] )
    # @t_value = TValue.new(t_value_params)

    respond_to do |format|
      if @t_value.save
        format.html { render :text => "ok" } # redirect_to @t_value, notice: 'T value was successfully created.' }
        format.json { render action: 'show', status: :created, location: @t_value }
      else
        format.html { render action: 'new' }
        format.json { render json: @t_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /t_values/1
  # PATCH/PUT /t_values/1.json
  def update
    respond_to do |format|
      if @t_value.update(t_value_params)
        format.html { redirect_to @t_value, notice: 'T value was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @t_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /t_values/1
  # DELETE /t_values/1.json
  def destroy
    @t_value.destroy
    respond_to do |format|
      format.html { redirect_to t_values_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_t_value
      @t_value = TValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def t_value_params
      params.require(:t_value).permit(:title, :_title, :heads, :items, :theader_id)
    end
end
