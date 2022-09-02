# frozen_string_literal: true

module DryController
  extend ActiveSupport::Concern

  included do
    before_action :set_resource_class
    before_action :set_index, only: :index
    before_action :set_show, only: [:show, :edit, :update, :destroy]
  end

  def index
    @resource ||= resource_class.new
  end

  def show; end

  def new
    @resource = resource_class.new
  end

  def edit; end

  def create
    @resource = resource_class.new(resource_params)

    if @resource.save
      respond_to do |format|
        format.html do
          redirect_to "/" + controller_path,
            notice: I18n.t("views.common.created.success", name: resource_class.model_name.human)
        end
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @resource.update(resource_params)
      flash[:notice] = I18n.t("views.common.updated.success", name: resource_class.model_name.human)
      redirect_to(redirect_after_update)
    else
      flash[:error] = I18n.t("views.common.updated.error", name: resource_class.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @resource.destroy
      flash[:notice] = I18n.t("views.common.destroyed.success", name: resource_class.model_name.human)
      redirect_to("/" + controller_path)
    else
      flash[:error] = I18n.t("views.common.destroyed.error", name: resource_class.model_name.human)
      render(:edit)
    end
  end

  private

  def resource_class
    case controller_path.classify.downcase.to_s
    when "account"
      "User".constantize
    else
      controller_path.classify.constantize
    end
  end

  def set_index
    @resources = @resource_class.all
    # TODO: use pagy for pagination
    # @resources = @resource_class.all.page(params[:page])
    # @resources = @resources.unscope(:order).order("#{order} #{sort}") if params[:order].present?
  end

  def set_show
    @resource = resource_class.find(params[:id])
  end

  def set_resource_class
    @resource_class = resource_class
  end

  def redirect_after_update
    case controller_path.classify.downcase.to_s
    when "account"
      account_path(@resource)
    else
      "/" + controller_path
    end
  end
end
