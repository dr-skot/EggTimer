# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

# mocking/stubbing (for testing)
require 'rubygems'
require 'motion-stump'

Motion::Project::App.setup do |app|
  app.name = 'EggTimer'

  # observable pattern
  app.files.unshift '../common/Observable.rb'

  # convenience mixin for building controllers
  app.files << '../common/UIViewController.rb'
end
