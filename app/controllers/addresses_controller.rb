class AddressesController < ApplicationController

  respond_to :html, :js

  def new
    @address = Address.new

    respond_with @address
  end

  def show
  end

  def create
    @address = Address.new(address_params)
    respond_to do |format|
      if @address.save
        current_user.addresses << @address
        format.html { redirect_to users_show_path, notice: 'Address created' }
        format.json { render json: @address, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: 'Failure' }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def address_params
      begin
        params.require(:address).permit(:name, :street, :country, :city, :postal_number, :phone_number, :description, :home)
      rescue ActionController::ParameterMissing
        nil
      end
    end
end
