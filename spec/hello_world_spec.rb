require 'hello_world'

describe HelloWorld do
  it "returns 'hello'" do
    expect(HelloWorld.hello).to eq('hello')
  end
end
