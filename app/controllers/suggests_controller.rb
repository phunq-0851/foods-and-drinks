class SuggestsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_suggest, only: %i(destroy update edit)

  def index
    @suggests = Suggest.suggest_by_user(current_user).page(params[:page]).per Settings.paginate.per_page
  end

  def new
    @suggest = Suggest.new
  end

  def create
    @suggest = current_user.suggests.build suggest_params
    if @suggest.save
      flash[:success] = t "controllers.users.suggest_succ"
      redirect_to suggests_path
    else
      flash[:danger] = t "controllers.users.suggest_fail"
      render :new
    end
  end

  def edit; end

  def update
    if @suggest.update suggest_params
      flash[:success] = t "controllers.users.suggest_succ"
      redirect_to suggests_path
    else
      flash[:danger] = t "controllers.users.suggest_fail"
      render :edit
    end
  end

  def destroy
    if @suggest.destroy
      flash[:success] = t "controllers.users.delete_succ"
    else
      flash[:danger] = t "controllers.users.delete_fail"
    end
    redirect_to suggests_path
  end

  private
  def suggest_params
    params.require(:suggest).permit :name, :describe
  end

  def load_suggest
    @suggest = Suggest.find_by id: params[:id]
    return if @suggest
    flash[:danger] = t "controllers.users.not-found"
  end
end
