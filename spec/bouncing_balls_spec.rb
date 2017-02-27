require 'bouncing_balls'


describe BouncingBalls do


  context 'checking variables' do
    let(:subject) {described_class.new(10, 0.5, 5)}
    it 'should have a readable variable called height which is greater than 0' do
      expect(subject.height).to be >= 0
    end

    it 'should have a variable called bounce which is between 0 and 1' do
      expect(subject.bounce).to be_within(0.5).of (0.5)
    end

    it 'should have a variable called window which is greater than 0 and less than height' do
      expect(subject.window).to be >= 0
      expect(subject.window).to be < (subject.height)
    end
  end

  context 'checking variable method returns -1' do

    it 'should return -1 when the variables are not integers' do
      subject = BouncingBalls.new("string", 0.5, 1 )
      expect(subject.check_variables).to eq(-1)
    end

    it 'should return -1 when the variables are not integers' do
      subject = BouncingBalls.new(10, "String", 1 )
      expect(subject.check_variables).to eq(-1)
    end

    it 'should return -1 when the variables are not integers' do
      subject = BouncingBalls.new(10, 0.5, "String" )
      expect(subject.check_variables).to eq(-1)
    end

    it 'should return -1 when the height is less than 0' do
      subject = BouncingBalls.new(-1, 0.5, 5)
      expect(subject.check_variables).to eq(-1)
    end

    it 'should return -1 when the bounce is greater than 1' do
      subject = BouncingBalls.new(10, 2, 5)
      expect(subject.check_variables).to eq(-1)
    end

    it 'should return -1 when the bounce is less than 0' do
      subject = BouncingBalls.new(10, -1, 5)
      expect(subject.check_variables).to eq(-1)
    end

    it 'should return -1 when the window is greater than height' do
      subject = BouncingBalls.new(10, 0.5, 11)
      expect(subject.check_variables).to eq(-1)
    end

    it 'should return -1 when the window is less than 0' do
      subject = BouncingBalls.new(10, 0.5, -1)
      expect(subject.check_variables).to eq(-1)
    end

  end
end
