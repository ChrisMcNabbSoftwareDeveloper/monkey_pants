require 'spec_helper'

describe FrogManController do

  it "should show someting" do
    get :show, :id => 5
  end
end
