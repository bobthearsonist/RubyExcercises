require 'hello_world'

describe HelloWorld do
  describe '.hello' do
    context 'given execution' do
      it "returns 'hello'" do
        expect(HelloWorld.hello).to eq('hello')
      end
    end
  end
end
