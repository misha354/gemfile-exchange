class GemfilesController < ApplicationController
  before_action :require_user, only: [:new, :edit, :create, :update, :vote]
  before_action :find_gemfile, only: [:edit, :update, :vote]

  def index
    @gemfiles = Gemfile.all.sort_by {|x| x.total_votes}.reverse
  end

  def new
    @gemfile = Gemfile.new
  end

  def create
    @gemfile = Gemfile.new(gemfile_params)
    @gemfile.user = current_user
    
    if @gemfile.save
      flash[:notice] = 'Your Gemfile was saved.'
      redirect_to gemfile_path(@gemfile)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @gemfile.update(gemfile_params)
      flash[:notice] = "Your gemfile was updated."
      redirect_to gemfile_path(@gemfile)
    else
      render 'edit'
    end
  end
  
  def show
    @gemfile = Gemfile.find params[:id]
      @gem_uses = GemUse.where(gemfile_id: @gemfile.id).each do |gem_use|
    end

    @highlighted_code = display_source(@gemfile.source)
  end

  def vote     
    vote = Vote.new(vote: params[:vote], gemfile: @gemfile)
    
    if !vote.save
      flash[:notice] = 'You can only vote once'
    end
    
    redirect_to gemfile_path(@gemfile)
  end

  private 

  def display_source(source)
    formatter = Rouge::Formatters::HTML.new(css_class: 'highlight')
    lexer = Rouge::Lexers::Ruby.new
    formatter.format(lexer.lex(source))
  end

  def gemfile_params
    params.require(:gemfile).permit(:source, :name, :description)
  end

  def find_gemfile
    @gemfile = Gemfile.find params[:id]
  end

end