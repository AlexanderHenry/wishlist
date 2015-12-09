class ItemsController < ApplicationController
	before_action :authenticate_user!
  # /lists/:id/items
	def index
		#params[:list_id] id of the list
		@list = current_user.lists.find params[:list_id]
		@items = @list.items
	end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  	#Edit takes you TO the form to be edited
    # GET /lists/1/edit
  def edit
  	@list = current_user.lists.find params[:list_id]
    @item = @list.items.find(params[:id])
  end

  	#New takes you TO the form to be created
	# Does not create, shows new
	def new
		@list = current_user.lists.find params[:list_id]
		@item = @list.items.build
	end

		#Actually creates after form is filled out
  def create
    @list = current_user.lists.find params[:list_id]
    @item = @list.items.build(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to list_items_path(@list), notice: 'Item was successfully created.' }
        #format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        #format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  #Update actually updates the edited form
  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
  	@list = current_user.lists.find params[:list_id]
    @item = @list.items.find(params[:id])
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to list_items_path(@list), notice: 'Item was successfully updated.' }
        #format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        #format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
  	@list = current_user.lists.find params[:list_id]
    @item = @list.items.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html { redirect_to list_items_path(@list), notice: 'Item was successfully removed.' }
      #format.json { head :no_content }
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # Protects from people passing in something they shouldn't, only accept these parameters
    def item_params
      params.require(:item).permit(:name, :max_price, :url, :notes, :model_number)
    end

end