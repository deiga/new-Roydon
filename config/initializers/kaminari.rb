module Kaminari
  module Helpers
    class Paginator
      PageProxy.class_eval do
        def taggable?
          return left_outer? || right_outer? || inside_window?
        end
      end
    end
  end
end
