class Report < ActiveRecord::Base
  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  PERIOD_TYPES = %w(monthly quarterly yearly other)
  STATUSES = %w(draft in_progress generated approved)

  validates :name, presence: true
  validates :period_type, inclusion: { in: PERIOD_TYPES }
  validates :status, inclusion: { in: STATUSES }

  scope :ordered, -> { order(created_at: :desc) }

  def self.period_types_for_select
    PERIOD_TYPES.map { |type| [I18n.t("reports.period_types.#{type}"), type] }
  end

  def self.statuses_for_select
    STATUSES.map { |status| [I18n.t("reports.statuses.#{status}"), status] }
  end
end