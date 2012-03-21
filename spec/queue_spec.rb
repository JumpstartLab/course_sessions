require 'spec_helper'
require 'event_reporter/queue'

describe EventReporter::Queue do
  describe ".valid_parameters?" do
    context "when the parameters are valid" do
      it "returns true with 'save to <filename>'" do
        params = ["save", "to", "file.csv"]
        EventReporter::Queue.valid_parameters?(params).should be_true
      end

      it "returns true with 'print'" do
        params = ["print"]
        EventReporter::Queue.valid_parameters?(params).should be_true
      end

      it "returns true with 'print by attribute'" do
        params = ["print", "by", "attribute"]
        EventReporter::Queue.valid_parameters?(params).should be_true
      end

      it "returns true with 'count'" do
        params = ["count"]
        EventReporter::Queue.valid_parameters?(params).should be_true        
      end

      it "returns true with 'clear'" do
        params = ["clear"]
        EventReporter::Queue.valid_parameters?(params).should be_true        
      end
    end

    context "when the parameters are invalid" do
      [ ["invalid_command"],
        ["print", "by"],
        ["print", "to", "filename"],
        [],
        ["save", "to"],
        ["save", "by"]
      ].each do |params|
        it "returns false with #{params.inspect}" do
          EventReporter::Queue.valid_parameters?(params).should be_false
        end
      end
    end
  end

  describe "#call" do
    context "when the command is count" do
      let(:command) { ["count"] }
      let(:queue)   { EventReporter::Queue.new }

      context "when the queue is empty" do
        it "returns 0" do
          queue.call(command).should be_zero
        end
      end

      context "when the queue is not empty" do
        it "returns the count of items in the queue" do
          queue << :item1
          queue.call(command).should == 1

          queue << :item2
          queue.call(command).should == 2
        end
      end
    end
  end

  describe "#clear" do
    context "when there are items in the queue" do
      it "removes the items from the queue" do
        queue = EventReporter::Queue.new
        queue << :item1
        queue << :item2

        queue.call(["clear"])
        queue.count.should be_zero
      end
    end

    context "when there are no items in the queue" do
      it "does nothing" do
        queue = EventReporter::Queue.new

        queue.call(["clear"])
        queue.count.should be_zero
      end
    end
  end
end

