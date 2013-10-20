require 'inheritable_attr'

class Base
  inheritable_attr :numbers, default: []
  inheritable_attr :letters
end

class Sub < Base

end

describe InheritableAttr do
  subject { Base }

  its(:numbers) { should == [] }
  its(:letters) { should be_nil }
  its('new.numbers') { should == [] }
  its('new.letters') { should be_nil }

  its(:numbers) { should_not equal subject.new.numbers }

  context "with a subclass" do
    before do
      Base.numbers = [1, 2, 3]
      Base.letters = %w(a b c)
    end

    subject { Sub }

    # Objects should be cloned
    its(:numbers) { should_not equal Base.numbers }
    its(:letters) { should_not equal Base.letters }

    its(:numbers) { should == [1, 2, 3] }
    its(:letters) { should == %w(a b c) }

    context "when changing subclass values" do
      subject { Sub.new }
      before { subject.numbers << 4 }

      its(:numbers) { should == [1, 2, 3, 4] }

      it "should not affect the superclass" do
        Base.numbers.should == [1, 2, 3]
      end
    end
  end
end