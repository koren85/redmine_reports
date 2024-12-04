class ReportsHookListener < Redmine::Hook::ViewListener
  def view_layouts_base_html_head(context = {})
    stylesheet_link_tag('reports', plugin: 'redmine_reports') +
      javascript_include_tag('reports', plugin: 'redmine_reports')
  end
end