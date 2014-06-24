require 'pry'

class FrogManController < ApplicationController
  def show
     puts "params from frog_man => #{params}"
     binding.pry
     render :nothing => true
  end
end
