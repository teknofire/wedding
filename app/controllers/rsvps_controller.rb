class RsvpsController < ApplicationController
  before_action :set_rsvp#, only: [:show, :edit, :update, :destroy]

  # GET /rsvps/1
  # GET /rsvps/1.json
  def show
    render layout: 'welcome'
  end

  # GET /rsvps/new
  def new
    if @rsvp.present?
      redirect_to edit_rsvp_path(@rsvp)
    else
      @rsvp = Rsvp.new
    end
  end

  # GET /rsvps/1/edit
  def edit
  end

  # POST /rsvps
  # POST /rsvps.json
  def create
    @rsvp = Rsvp.new(rsvp_params)
    respond_to do |format|
      if @rsvp.save
        self.current_rsvp = @rsvp
        format.html { redirect_to @rsvp, notice: 'Rsvp was successfully created.' }
        format.json { render :show, status: :created, location: @rsvp }
      else
        format.html { render :new }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rsvps/1
  # PATCH/PUT /rsvps/1.json
  def update
    respond_to do |format|
      if @rsvp.update(rsvp_params)
        format.html { redirect_to @rsvp, notice: 'Rsvp was successfully updated.' }
        format.json { render :show, status: :ok, location: @rsvp }
      else
        format.html { render :edit }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rsvps/1
  # DELETE /rsvps/1.json
  def destroy
    @rsvp.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Rsvp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rsvp
      @rsvp = current_rsvp
    rescue ActiveRecord::RecordNotFound
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rsvp_params
      params.require(:rsvp).permit(:email, :name, :coming, :overnight, :additional_guest, :message)
    end
end
