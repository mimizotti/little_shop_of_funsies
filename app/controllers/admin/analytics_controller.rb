class Admin::AnalyticsController < ApplicationController
before_action :require_admin

def index
  @analytics = BizIntel.new
end

end
