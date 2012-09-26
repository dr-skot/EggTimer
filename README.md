# EggTimer

circular timer for iOS

```ruby
@timer = EggTimer.new(5) # 5 second timer
view.layer.addSublayer @timer.circle

@timer.when(:didExpire) do
  # something
end

@timer.start
```

also

```ruby
@timer.stop
@timer.reset
```
