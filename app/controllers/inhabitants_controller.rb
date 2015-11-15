class InhabitantsController < ApplicationController

  # GET /inhabitants
  # GET /inhabitants.json
  def index
    @inhabitants = Inhabitant.where(:user_id => session[:user_id])
    respond_to do |format|
      format.html # index.html.save.erb
      format.json { render json: @inhabitants }
    end
  end

  # GET /inhabitants/new
  # GET /inhabitants/new.json
  def new
    @inhabitant = Inhabitant.new
    @inhabitant.user = User.find(session[:user_id])
    @inhabitant.user_id = session[:user_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inhabitant }
    end
  end

  # GET /inhabitants/1/edit
  def edit
    @inhabitant = Inhabitant.find(params[:id])
  end

  # POST /inhabitants
  # POST /inhabitants.json
  def create
    @inhabitant = Inhabitant.new(params[:inhabitant])
    @inhabitant.user_id = session[:user_id]
    respond_to do |format|
      if @inhabitant.save
          format.html { redirect_to inhabitants_url, notice: 'Inhabitant was successfully created.' }
          format.json { render json: @inhabitant, status: :created, location: @inhabitant }
      else
        format.html { render action: "new" }
        format.json { render json: @inhabitant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inhabitants/1
  # PUT /inhabitants/1.json
  def update
    @inhabitant = Inhabitant.find_by_id(params[:id])

    respond_to do |format|
      if @inhabitant.update_attributes(params[:inhabitant])
        format.html { redirect_to inhabitants_url, notice: 'Inhabitant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inhabitant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inhabitants/1
  # DELETE /inhabitants/1.json
  def destroy
    @inhabitant = Inhabitant.find_by_id(params[:id])
    @inhabitant.destroy

    respond_to do |format|
      format.html { redirect_to inhabitants_url }
      format.json { head :no_content }
    end
  end

  # GET /inhabitants/church
  def church
    @inhabitants = Inhabitant.all

    respond_to do |format|
      format.html { render html: @inhabitants}
      format.json { render json: @inhabitants }
    end
  end

  # GET /inhabitant/court
  def court
    @inhabitants = Inhabitant.all
    respond_to do |format|
      format.html { render html: @inhabitants}
      format.json { render json: @inhabitants }
    end
  end
end
