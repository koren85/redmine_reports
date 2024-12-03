class ReportsController < ApplicationController
  before_action :require_login
  before_action :build_query, only: [:index]

  helper :sort
  include SortHelper

  def index
    sort_init 'created_at', 'desc'
    sort_update %w(id name period_type period_start period_end status created_at
                  created_by_id updated_at updated_by_id total_hours contract_number)

    @limit = per_page_option

    @reports_count = @query.count
    @reports_pages = Paginator.new @reports_count, @limit, params['page']
    @offset = @reports_pages.offset

    @reports = @query.order(sort_clause)
                     .limit(@limit)
                     .offset(@offset)
                     .to_a

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def build_query
    @query = Report.joins(:created_by, :updated_by)

    if params[:period_type].present?
      @query = @query.where(period_type: params[:period_type])
    end

    if params[:status].present?
      @query = @query.where(status: params[:status])
    end

    if params[:period_start].present?
      @query = @query.where('period_start >= ?', params[:period_start])
    end

    if params[:period_end].present?
      @query = @query.where('period_end <= ?', params[:period_end])
    end

    if params[:contract_number].present?
      @query = @query.where('contract_number LIKE ?', "%#{params[:contract_number]}%")
    end

    if params[:created_by_id].present?
      @query = @query.where(created_by_id: params[:created_by_id])
    end
  end
end