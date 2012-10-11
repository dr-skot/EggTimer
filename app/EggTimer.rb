class EggTimer
  include Observable

  attr_reader :circle
  
  def initialize(duration, options = {})
    @duration = duration
    color = options[:color] || UIColor.redColor
    r = options[:radius] || 10.0

    @circle = CAShapeLayer.layer

    pi = Math::PI
    @circle = CAShapeLayer.layer
    @circle.path = UIBezierPath.bezierPathWithArcCenter([0, 0], radius:r/2,
         startAngle:-pi/2, endAngle:3*pi/2, clockwise:true).CGPath
    @circle.lineWidth = r
    @circle.fillColor = UIColor.clearColor.CGColor
    @circle.strokeColor = color.CGColor
    @circle.strokeEnd = 0

    @currentTime = 0
    @running = false
  end

  def centerAt(x, y)
    unanimated { @circle.position = [x, y] }
  end

  def start
    unless @running
      @running = true
      timeLeft = @duration - @currentTime
      @startTime = Time.new
      animated(timeLeft, :completion => lambda { expire }) do
        @circle.strokeEnd = 1
      end
    end
  end

  def expire
    @running = false
    notify_observers(:didExpire)
  end

  def stop
    if @running
      @running = false
      @currentTime += Time.new - @startTime
      pos = @currentTime / @duration
      unanimated { @circle.strokeEnd = pos }
    end
  end

  def reset
    @currentTime = 0
    @running = false
    unanimated { @circle.strokeEnd = 0 }
  end

  def animated(duration, options = {})
    options[:timing] ||= KCAMediaTimingFunctionLinear

    CATransaction.begin
    CATransaction.setAnimationDuration(duration)
    f = CAMediaTimingFunction.functionWithName(options[:timing])
    CATransaction.setAnimationTimingFunction(f)
    CATransaction.setCompletionBlock(options[:completion])
    yield
    CATransaction.commit
  end

  def unanimated(options = {})
    animated(0, options) { yield }
    # CATransaction.begin
    # CATransaction.setDisableActions(true)
    # CATransaction.setCompletionBlock(options[:completion])
    # yield
    # CATransaction.commit
  end

end
