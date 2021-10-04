# frozen_string_literal: true

require 'zeitwerk'
loader = Zeitwerk::Loader.for_gem
loader.collapse("#{__dir__}/invaders/data")
loader.setup

module Invaders
  class Error < StandardError; end
end
loader.eager_load
