require 'spec_helper'
require 'pry'

describe Set do
  before :each do
    @shortset = Set.new([1].shuffle)
    @mediumset = Set.new([1, 2, 3, 4, 5, 6].shuffle)
    @mediumset2 = Set.new([4, 5, 6, 7, 8, 9].shuffle)
  end

  it "accepts only an array as an argument" do
    expect(Set.new([1,2,3]).to_array).to contain_exactly(1,2,3)
    expect(Set.new(1).to_array).to contain_exactly()
    expect(Set.new("a").to_array).to contain_exactly()
  end

  it "will create a set with unique elements" do
    expect(Set.new([1, 1, 2]).to_array).to contain_exactly(1, 2) 
  end

  describe "#to_array" do
    it "returns an array of all elements in the set" do
      @set = Set.new([1])
      expect(@set.to_array).to contain_exactly(1)
    end
  end

  describe "#add" do
    it "adds elements to a set" do
      @shortset.add(2)
      expect(@shortset.to_array).to contain_exactly(1, 2)
    end

    it "only adds unique elements to the set" do
      @shortset.add(1)
      expect(@shortset.to_array).to contain_exactly(1)
    end
  end

  describe "#delete" do
    it "deletes elements from a set" do
      @mediumset.delete(3)
      expect(@mediumset.to_array).to contain_exactly(1, 2, 4, 5, 6)
    end
  end

  describe "#contains" do
    it "returns true if the set contains the specified element" do
      expect(@shortset.contains(1)).to be true
    end

    it "returns false if the set doesn't contain the specified element" do
      expect(@shortset.contains(5)).to be false
    end
  end

  describe "#union" do
    it "combines two sets together" do
      expect(@shortset.union(@mediumset).to_array).to include(1, 2, 3, 4, 5, 6)
    end
    it "should have a result consisting of all unique values" do
      expect(@shortset.union(@mediumset).to_array).to contain_exactly(1, 2, 3, 4, 5, 6)
    end
  end

  describe "#intersection" do
    it "finds the common values between two sets" do
      expect(@mediumset.intersection(@mediumset2).to_array).to contain_exactly(4, 5, 6)
    end
  end

  describe "#complement" do
    it "finds the different values of one set when compared to another" do
      expect(@shortset.complement(@mediumset)).to contain_exactly(2, 3, 4, 5, 6)
    end
  end

  describe "#xor" do
    it "compares two sets and finds what is exclusive to each one" do
      expect(@mediumset.xor(@mediumset2)).to contain_exactly(1, 2, 3, 7, 8, 9)
    end
  end

  describe "#subset" do
    it "returns true if a set is a subset of another" do
      expect(@shortset.subset(@mediumset)).to be true
    end
    it "returns false if a set is not a subset of another" do
      expect(@mediumset.subset(@shortset)).to be false
    end
  end

  describe "#sortSet" do
    it "sorts a set" do
      expect(@mediumset.sortSet).to eq(@mediumset.to_array.sort)
    end
  end

  describe "#reverseSet" do
    it "reverses the set" do
      expect(@mediumset2.reverseSet).to eq(@mediumset2.to_array.reverse!)
    end
  end
  
end