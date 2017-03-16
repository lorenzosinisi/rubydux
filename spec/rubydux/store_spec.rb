require "spec_helper"

describe Rubydux do
  INCREMENT = 'INCREMENT'.freeze
  DECREMENT = 'DECREMENT'.freeze

  describe Rubydux::Store do
    it "has nil as initial state if none given" do
      store = Rubydux::Store.new
      expect(store.state).to be_nil
    end

    describe "counter reducer" do
      let(:initial_state) { 0 }
      let(:reducer) do
        ->(state = initial_state, action) {
          case action[:type]
          when INCREMENT
            state + 1
          when DECREMENT
            state - 1
          else
            state
          end
        }
      end

      it "gets the initial state" do
        store = Rubydux::Store.new(0, &reducer)
        expect(store.state).to eq(0)
      end

      context 'dispatching actions' do
        it "should add one" do
          store = Rubydux::Store.new(0, &reducer)
          store.dispatch(type: INCREMENT)
          expect(store.state).to eq(1)
        end

        it "should add a lot of number" do
          store = Rubydux::Store.new(0, &reducer)
          10_00.times { store.dispatch(type: INCREMENT) }
          expect(store.state).to eq(10_00)
        end

        it "should remove one" do
          store = Rubydux::Store.new(0, &reducer)
          store.dispatch(type: DECREMENT)
          expect(store.state).to eq(-1)
        end
      end
    end
  end
end
