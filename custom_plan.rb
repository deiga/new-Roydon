require 'zeus/rails'

class CustomPlan < Zeus::Rails
  def test
    require 'simplecov'

    # require all ruby files
    Dir["#{Rails.root}/app/**/*.rb"].each { |f| load f }

    # run the tests
    super
  end

  def cucumber
    require 'simplecov'

    # require all ruby files
    # Dir["#{Rails.root}/app/**/*.rb"].each { |f| load f }

    # run the tests
    super
  end
end

Zeus.plan = CustomPlan.new
