class Mall < Rails::Engine
  config.generators do |g|
    g.hidden_namespaces << :test_unit << :erb << :active_record
    g.template_engine :haml
    g.test_framework :rspec, fixture: true, views: false, fixture_replacement: :factory_girl, view_specs: false
    g.view_specs false
    g.helper_specs false
    g.helper false
  end
end
