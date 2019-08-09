class KeyResourcesController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  before_action :set_key_resource, only: [:show, :edit, :update, :destroy]

  # GET /key_resources
  # GET /key_resources.json
  def index
    if params[:tag]
      @key_resources = KeyResource.where("tags like ?", "%#{params[:tag]}%")
    else
      @key_resources = KeyResource.all
    end
  end

  # GET /key_resources/1
  # GET /key_resources/1.json
  def show
  end

  # GET /key_resources/new
  def new
    @key_resource = KeyResource.new
  end

  # GET /key_resources/1/edit
  def edit
  end

  # POST /key_resources
  # POST /key_resources.json
  def create
    @key_resource = KeyResource.new(key_resource_params)
    @key_resource.created_by = current_user.uid

    respond_to do |format|
      if @key_resource.save
        format.html { redirect_to @key_resource, notice: 'Best bet was successfully created.' }
        format.json { render :show, status: :created, location: @key_resource }
      else
        format.html { render :new }
        format.json { render json: @key_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /key_resources/1
  # PATCH/PUT /key_resources/1.json
  def update
    respond_to do |format|
      if @key_resource.update(key_resource_params.merge(updated_by: current_user.uid))
        format.html { redirect_to @key_resource, notice: 'Best bet was successfully updated.' }
        format.json { render :show, status: :ok, location: @key_resource }
      else
        format.html { render :edit }
        format.json { render json: @key_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /key_resources/1
  # DELETE /key_resources/1.json
  def destroy
    @key_resource.destroy
    respond_to do |format|
      format.html { redirect_to key_resources_url, notice: 'Best bet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key_resource
      @key_resource = KeyResource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def key_resource_params
      params.require(:key_resource).permit(:title, :url, :description, :keywords, :tags, :created_by, :updated_by)
    end
end