# EggTimer

circular timer for iOS

```ruby
@timer = EggTimer.new(5) # 5 second timer
view.layer.addSublayer @timer.circle
@timer.add_observer self
@timer.start

# ...

def notify(object, notification)
    # object is @timer
    # notification is :didExpire
end
```

also

```ruby
@timer.stop
@timer.reset
```

## TODO

It would be more rubyish to say

```ruby
@timer.when(:didExpire) do
  # something
end
```