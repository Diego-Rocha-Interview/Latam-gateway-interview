class Api::AddressesController < ApplicationController
  include AuthToken

  before_action :authToken_authencaticator
  before_action :set_address, only: [:show, :update, :destroy]

  # GET /addresses
  def index
    @addresses = Address.all.by_token(@token)

    render json: @addresses
  end

  # GET /addresses/1
  def show
    render json: @address
  end

  # POST /addresses
  def create
    @address = Address.new(address_params.to_h.merge!({token:@token}))

    if @address.save
      render json: @address, status: :created, location: api_address_url(@address)
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /addresses/1
  def update
    if @address.update(address_params)
      render json: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # DELETE /addresses/1
  def destroy
    @address.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      
      @address ||= Address.get_information_address(cep)
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:cep,:state,:city,:district,:street)
    end
end
