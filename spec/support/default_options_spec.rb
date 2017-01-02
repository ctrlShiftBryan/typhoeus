require 'spec_helper'

describe "#default options" do
  it "get used after setting", :focus => true do;
    Faraday.default_connection_options.request.timeout = 10

    conn = Faraday.new 'http://nigiri.com/bar'
    other = Faraday.new :url => 'https://sushi.com/foo'
    other.options.timeout = 1
    expect(other.options.timeout).to eq(1)

    conn = Faraday.new 'http://nigiri.com/bar'
    expect(conn.options.timeout).to eq(10)
  end
end
