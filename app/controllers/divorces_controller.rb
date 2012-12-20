class DivorcesController < ApplicationController

  # GET /divorces/new
  # GET /divorces/new.json
  def new
    @divorce = Divorce.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @divorce }
    end
  end

  # # GET /divorces/1/edit
  # def edit
  #   @divorce = Divorce.find(params[:id])
  # end

  # POST /divorces
  # POST /divorces.json
  def create
    @divorce = Divorce.new(params[:divorce])

    respond_to do |format|
      if @divorce.save
        wedding = Wedding.get_wedding_by_spouse_id(@divorce.first_person_id)
        unless wedding.nil? then
          wedding.destroy
        end
        format.html { redirect_to inhabitants_path }
        format.json { render inhabitants_path }
      else
        format.html { render action: "new" }
        format.json { render json: @divorce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /divorces/1
  # DELETE /divorces/1.json
  def destroy
    @divorce = Divorce.find(params[:id])
    @divorce.destroy

    respond_to do |format|
      format.html { redirect_to divorces_url }
      format.json { head :no_content }
    end
  end
end
