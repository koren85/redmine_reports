Redmine::Plugin.register :redmine_reports do
  name 'Redmine Reports Plugin'
  author 'Your Name'
  description 'Plugin for managing reports in Redmine'
  version '0.0.1'

  # Добавление пункта меню
  menu :top_menu,
       :reports,
       { controller: 'reports', action: 'index' },
       caption: :label_reports,
       after: :projects,
       if: proc { User.current.logged? },
       html: { class: 'icon icon-report' }

  # Определение прав доступа
  project_module :reports do
    permission :view_reports, reports: [:index]
    permission :manage_reports, reports: [:index, :new, :create, :edit, :update, :destroy]
  end

  settings default: {
    'default_per_page' => '25'
  }, partial: 'settings/reports_settings'

  # Регистрация стилей
  requires_redmine_plugin :redmine_base_deface, :version_or_higher => '0.0.1'


end

# Подключение стилей и скриптов
Rails.application.config.after_initialize do
  require_dependency 'reports_hook_listener'
end