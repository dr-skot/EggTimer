class EggTimerController < UIViewController
  include Observable

  def viewDidLoad
    super
    
    cx = view.center.x
    cy = view.center.y
    w = cx * 2
    h = cy * 2

    radius = 50
    color = UIColor.orangeColor
    @timer = EggTimer.new(4, :radius => radius, :color => color)
    view.layer.addSublayer(@timer.circle)

    @timer.centerAt(cx, cy)

    addButton("start").center = [w/4, h-100]
    addButton("stop").center = [w/2, h-100]
    addButton("reset").center = [3*w/4, h-100]

    true
  end

  def startButton
    p "start"
    @timer.start
  end

  def stopButton
    p "stop"
    @timer.stop
  end

  def resetButton
    p "reset"
    @timer.reset
  end

end
