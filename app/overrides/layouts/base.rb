Deface::Override.new(
  :virtual_path => 'layouts/base',
  :name => 'add_reports_styles',
  :insert_bottom => 'head',
  :text => "<%= stylesheet_link_tag 'reports', :plugin => 'redmine_reports' %>"
)