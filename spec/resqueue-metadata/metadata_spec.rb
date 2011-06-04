require "spec_helper"

describe Resque::Queue::Metadata do

  before(:all) do
    @queue = "work-one"
    @metadata = Resque::Queue::Metadata.new(@queue)
    # If we have two different instances accessing the values then it can't be being stored in ruby memory
    @othermeta = Resque::Queue::Metadata.new(@queue)
  end

  describe "with no values already stored" do
    it "should convert to an empty hash" do
      @metadata.to_h.should == {}
    end
    it "should store a value successfully" do
      @metadata["something"] = "foo"
      @metadata["something"].should == "foo"
      @othermeta["something"].should == "foo"
    end
  end

  describe "with values already stored" do
    before do
      @metadata["something"] = "foo"
      @metadata["count"] = 5
    end
    it "should return a hash of data" do
      @othermeta.to_h.should == {"something" => "foo", "count" => "5"}
    end
    it "should clear everything when told to" do
      @metadata.clear
      @othermeta.to_h.should == {}
    end
    it "should overwrite existing values with new ones" do
      @othermeta["something"].should == "foo"
      @metadata["something"] = "fred"
      @othermeta["something"].should == "fred"
    end
  end

end
