class StaticPagesController < ApplicationController
  def home
    redirect_to meds_path if signed_in?
  end

  def about
  end
end
