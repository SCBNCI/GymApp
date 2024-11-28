class GroupClassController < ApplicationController 
  before_action :set_group_class, only: [:show, :edit, :update, :destroy, :book]

  # Display a list of all group classes
  def index
    @group_classes = GroupClass.all
  end

  # Show the details of a single group class
  def show
  end

  # Initialize a new GroupClass object for the form
  def new
    @group_class = GroupClass.new
  end

  # Create a new group class with the provided parameters
  def create
    puts group_class_params.inspect # Debugging: Output the parameters to the console
    @group_class = GroupClass.new(group_class_params)
    if @group_class.save
      # Redirect to the index page with a success message
      redirect_to group_class_index_path, notice: "Group class was successfully created."
    else
      # Re-render the 'new' form with error messages
      render :new
    end
  end
  
  # Render the edit form for the selected group class
  def edit
  end

  # Update the selected group class with new attributes
  def update
    if @group_class.update(group_class_params)
      # Redirect to the index page with a success message
      redirect_to group_class_index_path, notice: "Group class was successfully updated."
    else
      # Re-render the 'edit' form with error messages
      render :edit
    end
  end

  # Delete the selected group class
  def destroy
    @group_class.destroy
    # Redirect to the index page with a success message
    redirect_to group_class_index_path, notice: "Group class was successfully deleted."
  end

  # Book a group class for a gym member
  def book
    # Load all gym members and order them alphabetically by first name
    @gym_members = GymMember.all.order(:first_name) 
  
    # Handle booking when the request method is POST
    if request.post?
      # Check if a gym member was selected
      if params[:gym_member_id].blank?
        flash[:alert] = "No Gym Member selected."
        redirect_to book_group_class_path(@group_class) and return
      end

      # Find the selected gym member by ID
      @gym_member = GymMember.find_by(id: params[:gym_member_id])

      # Handle cases where the gym member is invalid or already booked
      if @gym_member.nil?
        flash[:alert] = "No Gym Member selected."
        redirect_to book_group_class_path(@group_class) and return
      elsif @group_class.gym_members.include?(@gym_member)
        flash[:alert] = "This member has already booked this class."
        redirect_to group_class_index_path(@group_class) and return
      else
        # Add the gym member to the group class and confirm the booking
        @group_class.gym_members << @gym_member
        flash[:notice] = "Booking confirmed for the group class."
        redirect_to group_class_index_path(@group_class)
      end
    end
  end
  
  private

  # Find and set the group class based on the ID in the parameters
  def set_group_class
    @group_class = GroupClass.find(params[:id])
  end

  # Permit only specific attributes for group class creation and updating
  def group_class_params
    params.require(:group_class).permit(:gym_staff_id, :date, :time, :class_type)
  end
end
