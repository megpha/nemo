# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'rubygems'
require 'bundler'

Bundler.require
require 'bubble-wrap/all'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'nemo'

  app.pods do
    pod 'RestKit', git: 'https://github.com/RestKit/RestKit.git', branch: 'development'
  end

  app.pixate.framework = 'vendor/PXEngine.framework'
end
