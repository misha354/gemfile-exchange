class GemfilesController < ApplicationController
  def new
    @gemfile = Gemfile.new
  end

  def show
    source = "if x < y require 'me' end"
    @highlighted_code = display_source(source)
  end

  private 

  def display_source(source)
    formatter = Rouge::Formatters::HTML.new(css_class: 'highlight')
    lexer = Rouge::Lexers::Ruby.new
    formatter.format(lexer.lex(source))
  end
  end