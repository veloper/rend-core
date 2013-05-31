require_rend = if defined?(require_relative)
  lambda { |path| require_relative path }
else
  lambda { |path| require "rend/#{path}" }
end

require_rend['core/exception']
require_rend['core/helpers/php']

module Rend
  module Core
  end
end
