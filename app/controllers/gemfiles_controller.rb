class GemfilesController < ApplicationController
  def new
    @gemfile = Gemfile.new
  end

  def create
    @gemfile = Gemfile.new(gemfile_params)
    if @gemfile.save
      flash[:notice] = 'Your Gemfile was saved.'
      redirect_to gemfile_path(@gemfile)
    else
      render 'new'
    end

  end
  
  def show
    @gemfile = Gemfile.find params[:id]
    @gem_uses = GemUse.where(gemfile_id: @gemfile.id).each do |gem_use|
    end

    @highlighted_code = display_source(@gemfile.source)
  end

  private 

  def display_source(source)
    formatter = Rouge::Formatters::HTML.new(css_class: 'highlight')
    lexer = Rouge::Lexers::Ruby.new
    formatter.format(lexer.lex(source))
  end

  def gemfile_params
    params.require(:gemfile).permit(:source, :name)
  end
  end