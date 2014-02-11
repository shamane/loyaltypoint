namespace :db do
  desc 'populate point_line_item'
  task populate_point_line_item: :environment do
    user_id = User.first.id
    
    INFOS = [
      {
        points: 25, 
        source: 'Joined Loyalty Program', 
        created_at: '01/01/2013'
      },
      {
        points: 410, 
        source: 'Placed an order', 
        created_at: '10/02/2013'
      },
      {
        points: -250, 
        source: 'Redeemed with an order', 
        created_at: '15/02/2013'
      },
      {
        points: 10, 
        source: 'Wrote a review', 
        created_at: '18/02/2013'
      },
      {
        points: 570, 
        source: 'Placed an order', 
        created_at: '12/03/2013'
      },
      {
        points: -500, 
        source: 'Redeemed with an order', 
        created_at: '15/04/2013'
      },
      {
        points: 130, 
        source: 'Made a purchase', 
        created_at: '27/06/2013'
      }
    ]
    
    INFOS.each do |data|
      PointLineItem.create!(user_id: user_id, points: data[:points], source: data[:source], created_at: data[:created_at])
    end
    
  end

  desc 'truncate point_line_item'
  task truncate_point_line_item: :environment do  
    ActiveRecord::Base.connection.execute("TRUNCATE point_line_items")
  end  
end
