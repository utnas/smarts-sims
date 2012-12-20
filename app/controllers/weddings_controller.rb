class WeddingsController < ApplicationController

  # GET /weddings/new
  # GET /weddings/new.json
  def new
    @wedding = Wedding.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wedding }
    end
  end

  # POST /weddings
  # POST /weddings.json
  def create
    @wedding = Wedding.new(params[:wedding])

    respond_to do |format|
      if @wedding.save
        format.html { redirect_to inhabitants_path }
        format.json { render inhabitants_path }
      else
        format.html { render action: "new" }
        format.json { render json: @wedding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weddings/1
  # DELETE /weddings/1.json
  def destroy
    @wedding = Wedding.find(params[:id])
    @wedding.destroy

    respond_to do |format|
      format.html { redirect_to weddings_url }
      format.json { head :no_content }
    end
  end
end
