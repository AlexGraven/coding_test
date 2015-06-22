class UpdatesController < ApplicationController
  before_action :set_update, only: [:show]

  # GET /updates
  # GET /updates.json
  def index
    @updates = Update.all
  end

  # GET /updates/1
  # GET /updates/1.json
  def show
  end

  # GET /updates/new
  def new
    @update = Update.new
  end

  # GET /updates/1/edit
  def edit
    render text: "Not supported", status: 501
  end

  # POST /updates
  # POST /updates.json
  def create
    @update = Update.new update_params
    errors = @update.create_users_from_batch

    respond_to do |format|
      if @update.save
        format.html { redirect_to @update, notice: 'Update was successfully created.' }
        format.json { render action: 'show', status: :created, location: @update }
      else
        format.html { render action: 'new' }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /updates/1
  # PATCH/PUT /updates/1.json
  def update
    render text: "Not supported", status: 501
  end

  # DELETE /updates/1
  # DELETE /updates/1.json
  def destroy
    render text: "Not supported", status: 501
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_update
      @update = Update.find(params[:id])
    end

   def update_params
     params[:update].permit(:csv_file)
   end
end
