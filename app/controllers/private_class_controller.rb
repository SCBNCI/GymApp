class PrivateClassController < ApplicationController
  before_action :set_private_class, only: [:show, :edit, :update, :destroy]

  # GET /private_class - Fetch and display all private classes
  def index
    @private_classes = PrivateClass.all
  end

  # GET /private_class/:id - Display the details of a single private class
  def show
  end

  # GET /private_class/new - Initialize a new PrivateClass object for the form
  def new
    @private_class = PrivateClass.new
  end

  # POST /private_class - Create a new private class with the provided parameters
  def create
    @private_class = PrivateClass.new(private_class_params)
    if @private_class.save
      # Redirect to the index page with a success message
      redirect_to private_class_index_path, notice: "Private class was successfully created."
    else
      # Re-render the 'new' form with error messages
      render :new
    end
  end

  # GET /private_class/:id/edit - Render the edit form for a specific private class
  def edit
  end

  # PATCH/PUT /private_class/:id - Update an existing private class with the provided parameters
  def update
    if @private_class.update(private_class_params)
      # Redirect to the index page with a success message
      redirect_to private_class_index_path, notice: "Private class was successfully updated."
    else
      # Re-render the 'edit' form with error messages
      render :edit
    end
  end

  # DELETE /private_class/:id - Delete a specific private class
  def destroy
    @private_class.destroy
    # Redirect to the index page with a success message
    redirect_to private_class_index_path, notice: "Private class was successfully deleted."
  end

  private

  # Callback to find and set the private class based on the ID in the parameters
  def set_private_class
    @private_class = PrivateClass.find(params[:id])
  end

  # Strong parameters: Only allow the permitted attributes to prevent mass assignment
  def private_class_params
    params.require(:private_class).permit(:gym_staff_id, :gym_member_id, :date, :time)
  end
end
