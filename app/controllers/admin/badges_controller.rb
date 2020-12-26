# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show edit update destroy]
  before_action :set_images, only: %i[new edit update create]

  def new
    @badge = Badge.new
  end

  def index
    @badges = Badge.all
  end

  def create
    params[:badge][:condition] = params[:badge][params[:badge][:rule_type]]
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t('.create')
    else
      render :index
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('.destroy')
  end

  def edit; end

  def update
    params[:badge][:condition] = params[:badge][params[:badge][:rule_type]]
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :edit
    end
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def set_images
    lib_badges = File.join('**', 'app/assets/images/badges', '*')
    @images = Dir.glob(lib_badges).map { |image| "badges/#{image.split('/').last}" }
  end

  def badge_params
    params.require(:badge).permit(:name, :image_name, :rule_type, :condition)
  end
end
