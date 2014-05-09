require "spec_helper"

describe Fetching::FetchingHash do

  specify "#to_hash" do
    hash = {one: 1, two: 2}
    fetching_hash = Fetching(hash)
    expect(fetching_hash.to_hash).to eq(hash)
  end

  specify "#to_hash doesn't allow you to break fetching" do
    fetching_hash = Fetching(one: 1, two: 2)
    hash = fetching_hash.to_hash
    hash[:one] = ":)"
    expect(fetching_hash.to_hash[:one]).to eq(1)
  end

  specify "#to_hash does a deep copy" do
    hash = {one: 1, two: {three: 3}}
    fetching_hash = Fetching(hash)
    expect(fetching_hash.to_hash).to eq(hash)
  end

end
