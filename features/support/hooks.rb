# aqui ficaram tudo que for pertinente a execução dos meus cenários.
# Nesse código ele limpa os cookies do navegador assim não tem perigo de dar falha

require_relative 'helper.rb'

Before do |scenario|
        Capybara.current_session.driver.browser.manage.delete_all_cookies
end

# Aqui ficara o código para tirar print 
After do |scenario|
    scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')

    if scenario.failed?
        print_screen(scenario_name.downcase!, 'Failed')

    else 
        print_screen(scenario_name.downcase!, 'Sucess')
    end
end