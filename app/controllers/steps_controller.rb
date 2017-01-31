require 'Recipe2pic.rb'
class StepsController < ApplicationController
  before_action :set_val, only: [:new, :get_img]
  def new
  end

  def get_img
    @img_urls = get_pic(params[:keyword][:keyword])
    render steps_new_path
  end

  def create
    recipe = Recipe.find(session[:recipe_id])
    recipe.steps.create()
  end

  def destroy
  end

  def set_val
    @recipe = Recipe.find(session[:recipe_id])
    @steps = @recipe.steps
    @step = @recipe.steps.last
    # TODO 順番をどこかにもたせる
    @element = @step.elements.new
  end

  def step_params
    # TODO stepにbodyカラム追加
    #params.require(:step).premit(:body)
  end
end
