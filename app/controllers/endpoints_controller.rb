class EndpointsController < ApplicationController
  before_action :set_endpoint, only: [:show, :edit, :update, :destroy]

  # GET /endpoints
  # GET /endpoints.json
  def index
    @endpoints = Endpoint.all
  end

  # GET /endpoints/1
  # GET /endpoints/1.json
  def show
  end

  # GET /endpoints/new
  def new
    @endpoint = Endpoint.new
  end

  # GET /endpoints/1/edit
  def edit
  end

  # POST /endpoints
  # POST /endpoints.json
  def create
    sns = Aws::SNS::Client.new
    response = sns.create_platform_endpoint(platform_application_arn: Rails.application.secrets.apns_application_arn, token: endpoint_params['device_token'])

    @endpoint = Endpoint.new(endpoint_params)
    @endpoint.arn = response[:endpoint_arn]

    respond_to do |format|
      if @endpoint.save
        format.html { redirect_to @endpoint, notice: 'Endpoint was successfully created.' }
        format.json { render :show, status: :created, location: @endpoint }
      else
        format.html { render :new }
        format.json { render json: @endpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /endpoints/1
  # PATCH/PUT /endpoints/1.json
  def update
    respond_to do |format|
      if @endpoint.update(endpoint_params)
        format.html { redirect_to @endpoint, notice: 'Endpoint was successfully updated.' }
        format.json { render :show, status: :ok, location: @endpoint }
      else
        format.html { render :edit }
        format.json { render json: @endpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /endpoints/1
  # DELETE /endpoints/1.json
  def destroy
    @endpoint.destroy
    respond_to do |format|
      format.html { redirect_to endpoints_url, notice: 'Endpoint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_endpoint
      @endpoint = Endpoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def endpoint_params
      params.require(:endpoint).permit(:user_id, :platform, :device_token)
    end
end
