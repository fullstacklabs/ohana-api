class Admin
  class SubcategoriesController < ApplicationController
    include Taggable

    before_action :authenticate_admin!
    layout 'admin'

    def new
      @category = Category.roots.find(params[:category_id])
      @subcategory = @category.children.new
      @subcategory.taxonomy_id = "#{@category.taxonomy_id}-#{(@category.children.count + 1).to_s.rjust(3, '0')}"
    end

    def create
      @category = Category.roots.find(params[:category_id])
      @subcategory = @category.children.new(subcategory_params)
      if (@subcategory.save)
        redirect_to edit_admin_category_path(@category)
      else
        render :new
      end
    end

    def edit
      @category = Category.roots.find(params[:category_id])
      @subcategory = @category.children.find(params[:id])
    end

    def update
      @category = Category.roots.find(params[:category_id])
      @subcategory = @category.children.find(params[:id])
      if (@subcategory.update(subcategory_params))
        redirect_to edit_admin_category_path(@category)
      else
        render :edit
      end
    end

    def destroy
      @category = Category.roots.find(params[:category_id])
      @subcategory = @category.children.find(params[:id])
      @subcategory.destroy
      redirect_to edit_admin_category_path(@category)
    end

    private
      def subcategory_params
        params.require(:category).permit(:name, :taxonomy_id)
      end
  end
end
