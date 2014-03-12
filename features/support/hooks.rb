Before do |scenario|
  # The +scenario+ argument is optional, but if you use it, you can get the title,
  # description, or name (title + description) of the scenario that is about to be
  # executed.
  Rails.logger.debug "Starting scenario: #{scenario.title}"
end

After do |scenario|
  if scenario.failed?
    save_page
    Cucumber.wants_to_quit = true
  end
end
