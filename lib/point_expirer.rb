class PointExpirer
  attr_reader :begin_period, :end_period

  def initialize(date)
    @begin_period = date.to_date - 2.year
    @end_period = date.to_date - 1.year
  end
            
  def expire
    collection = PointLineItem.points_by_period(begin_period, end_period)
    sum = collection.pluck(:points).inject(0){|sum, i| sum += i.to_f}

    npoints = PointLineItem.negative_points(end_period)
    sum_npoints = npoints.pluck(:points).inject(){|sum_npoints, i| sum_npoints += i.to_f}
    
    total_sum  = sum.to_i + sum_npoints.to_f
     
    PointLineItem.create!(user_id: User.first.id, points: "-#{total_sum}", source: "Points ##{collection.count} expired")
  end
end
