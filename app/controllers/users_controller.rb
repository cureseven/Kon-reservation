class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

      def login_form
        @user = nil
      render 'users/login'
    end

    def login
      @pass = params[:pass]
      logger.debug(@pass)
      @name = params[:name]
      @user = User.find_by(name:@name)
      if @pass == @user.pass
        redirect_to controller:'reserves',action:'index',name:@user.name
      else
        render 'users/login'
        end
      end
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

     @user.save
      redirect_to controller:'users',action:'login',name:@user.name,pass:@user.pass

#     respond_to do |format|
#       if @user.save        redirect_to controller:'users',action:'login',name:@user.name,pass:@user.pass
# #        format.html { redirect_to @user, notice: 'User was successfully created.' }
# #        format.json { render :show, status: :created, location: @user }
#       else
#         format.html { render :new }
#         format.json { render json: @user.errors, status: :unprocessable_entity }
#       end
#     end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :pass, :admin)
    end
end
