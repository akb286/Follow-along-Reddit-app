class SubsController < ApplicationController
  before_action :set_sub, only: [:show, :update, :edit, :destroy]

  # other action options:
  # skip_before_action :verify_paid, only: index
  # after_action :more_cowbell
  # skip_after_action :more_cowbell, only : [:new, :edit]


  def index
    @subs = Sub.all
  end

  def show
  end

  def new
    @sub = Sub.new
  end

  def edit
  end

  def create
    @sub = Sub.new(sub_params)

    if @sub.save
      redirect_to sub_path(@sub)
    else
      render :new
    end
  end

  def update
    if @sub.update(sub_params)
      redirect_to sub_path(@sub)
    else
      render :edit
    end
  end

  def destroy
    @sub.destroy
    redirect_to subs_path
  end

  private
    def sub_params
      params.require(:sub).permit(:name)
    end

    def set_sub
      @sub = Sub.find(params[:id])
    end



end
#what do new, edit, and show have in common? they are all GETS, which render HTML
