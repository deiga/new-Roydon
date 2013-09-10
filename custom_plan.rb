require 'zeus/rails'

class CustomPlan < Zeus::Rails

  def test
    require 'simplecov'
    require 'coveralls'
    SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
      SimpleCov::Formatter::HTMLFormatter,
      Coveralls::SimpleCov::Formatter
    ]
    SimpleCov.start 'rails'

    # require all ruby files
    Dir["#{Rails.root}/app/**/*.rb"].each { |f| load f }

    # run the tests
    super
  end

end

Zeus.plan = CustomPlan.new
