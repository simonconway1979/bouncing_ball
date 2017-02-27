require 'bouncing_balls'


describe BouncingBalls do


  context 'checking variables' do
    let(:subject) {described_class.new(10, 0.5, 5)}
    it 'should have a readable variable called height which is greater than 0' do
      expect(subject.height).to be >= 0
    end

    it 'should have a variable called bounce which is greater than 0 and less than 1' do
      expect(subject.bounce).to be >= 0
      expect(subject.bounce).to be < 1
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

  context 'calculate the bounce height' do
    it 'should return the height * the bounce' do
      subject = BouncingBalls.new(10, 0.5, 2)
      expect(subject.bounce_height).to eq(10 * 0.5)
    end
  end

  context 'check if the bounce is visible through the window' do
    it 'should return true if bounce height is greater than window' do
      subject = BouncingBalls.new(10, 0.5, 2)
      expect(subject.bounce_visible?).to eq(true)
    end

    it 'should return true if bounce height is equal to window' do
      subject = BouncingBalls.new(10, 0.5, 5)
      expect(subject.bounce_visible?).to eq(true)
    end

    it 'should return false if bounce height is less than window' do
      subject = BouncingBalls.new(10, 0.5, 6)
      expect(subject.bounce_visible?).to eq(false)
    end
  end

  context 'counting passes' do

    it 'should start the counter at 1 because it passes the window on the first drop' do
      subject = BouncingBalls.new(10, 0.5, 6)
      expect(subject.counter).to eq(1)
    end

    it 'should not increase the counter if the ball is not visible after the first bounce' do
      subject = BouncingBalls.new(10, 0.1, 2)
      subject.count_passes
      expect(subject.counter).to eq(1)
    end

    #Note the ball passes the window twice, upwards and downwards, if the bounce is higher than the window
    it 'should increase the counter by 2, to 3, if the ball is not visible after the second bounce' do
      subject = BouncingBalls.new(10, 0.3, 2)
      subject.count_passes
      expect(subject.counter).to eq(3)
    end

    it 'should increase the counter by 2 and 2, to 5, if the ball is not visible after the second bounce' do
      subject = BouncingBalls.new(10, 0.5, 2)
      subject.count_passes
      expect(subject.counter).to eq(5)
    end
  end
end
