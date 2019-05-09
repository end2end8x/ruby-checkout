class TotalDiscount
  attr_reader :percent, :require_total

  def initialize(percent:, require_total:)
    @percent = percent
    @require_total = require_total
  end

  def apply(total_origin, order)
    is_valid_rule(total_origin) ? apply_discount(total_origin) : 0
  end

  private

  def is_valid_rule(total_origin)
    total_origin > require_total
  end

  def apply_discount(total_origin)
    total_origin * percent / 100.0
  end
end
