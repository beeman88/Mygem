require 'spec_helper'

describe "sanity" do
  it "should return Hello world" do
    Mygem::hello.should == "Hello World"
  end
end