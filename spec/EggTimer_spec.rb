describe "EggTimer" do
  before do
    @timer = EggTimer.new(0.25)
  end

  it "notifies observers when it expires" do
    observer = mock(:notify) do |object, notification| 
      object.should == @timer
      notification.should == :didExpire
    end
    @timer.add_observer observer
    @timer.start
    wait (0.5) do
      # waiting
    end
  end
end
