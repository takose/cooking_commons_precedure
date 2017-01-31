class ElementsController < ApplicationController
  def create
    recipe = Recipe.find(session[:recipe_id])
    step = recipe.steps.last
    # TODO このlastどうにかする
    # TODO imgテーブルの重複を許すかどうか
    url = params[:url]
    keyword = params[:keyword]
    category = params[:category]
    if category == 'Verb'
      verb(step, keyword)
    elsif category == 'Material'
      material(step, keyword, url)
    elsif category == 'Tool'
      tool(step, keyword, url)
    end
    redirect_to steps_new_path
  end

  def material(step, keyword, url)
    @material = Material.find_by(body: keyword)
    unless @material
      @material =  Material.create(body: keyword)
    end
    img_url = @material.image_urls.create(body: url)
    step.elements.create(dictionary_type: 'Material', dictionary_id: @material.id, image_url_id: img_url.id)
  end

  def tool(step, keyword, url)
    @tool = Tool.find_by(body: keyword)
    unless @tool
      @tool =  Tool.create(body: keyword)
    end
    img_url = @tool.image_urls.create(body: url)
    step.elements.create(dictionary_type: 'Tool', dictionary_id: @tool.id, image_url_id: img_url.id)
  end

  def verb(step, keyword)
    @verb = Verb.find_by(body: keyword)
    unless @verb
      @verb =  Verb.create(body: keyword)
    end
    step.elements.create!(dictionary_type: 'Verb', dictionary_id: @verb.id, image_url_id: 1)
  end
end
