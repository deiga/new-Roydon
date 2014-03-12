require 'money-rails'
require 'mongoid-ancestry'
require 'mongoid_paperclip'

module Mall
  class Engine < ::Rails::Engine
    isolate_namespace Mall

  end
end
