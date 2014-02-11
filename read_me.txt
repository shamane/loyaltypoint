1.) bundle install
2.) rake db:drop db:create db:migrate  user:create db:populate_point_line_item
3.) rails c 
    > p = PointExpirer.new('2014-03-13')
    > p.expire
