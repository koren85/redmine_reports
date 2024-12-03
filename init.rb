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
end