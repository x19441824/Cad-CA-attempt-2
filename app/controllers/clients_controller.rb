class ClientsController < ApplicationController
  # Sets up a client object before certain actions
  before_action :set_client, only: %i[show edit update destroy]

  # Shows all clients.
  def index
    @clients = Client.all
  end

  # Displays a form for a new client.
  def new
    @client = Client.new
  end

  # Shows a single client.
  def show
  end

   # Displays a form for editing a client.
  def edit
    @client = Client.find(params[:id])
  end

  # Creates a client.
  def create
    @client = Client.new(client_params)

    # Responds to both HTML and JSON formats
    respond_to do |format|
      if @client.save
        # Redirects to the client's show page with a success message
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        # Renders the 'new' form again with error messages
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # Updates a client.
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

   # Deletes a client.
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Sets a client object from the database using the ID from the URL parameters
  def set_client
    @client = Client.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to clients_url, alert: 'Client not found.'
  end

  # Sanitizes the parameters by allowing only certain attributes to be used in actions
  def client_params
    params.require(:client).permit(:name, :email, :address, :phone_number, :description, :price, :image)
  end
end
