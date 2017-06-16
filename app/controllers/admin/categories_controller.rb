class Admin
  class CategoriesController < ApplicationController
    include Taggable

    before_action :authenticate_admin!
    layout 'admin'

    def index
      @categories = Category.roots.page(params[:page]).per(params[:per_page])
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(new_category_params)
      if @category.save
        redirect_to edit_admin_category_path(@category)
      else
        render :new
      end
    end

    def edit
      @category = Category.roots.find(params[:id])
    end

    def update
      @category = Category.roots.find(params[:id])
      if @category.update(edit_category_params)
        redirect_to admin_categories_path
      else
        render :edit
      end
    end

    def destroy
      @category = Category.roots.find(params[:id])
      @category.destroy
      redirect_to admin_categories_path
    end

    private
      def new_category_params
        params.require(:category).permit(:name, :taxonomy_id)
      end

      def edit_category_params
        params.require(:category).permit(:name)
      end

  end
end
