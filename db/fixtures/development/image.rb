Sample.seed do |sample|
  sample.id = 1
  sample.image = Rails.root.join("db/fixtures/images/Image1.jpg").open
end
Sample.seed do |sample|
  sample.id = 2
  sample.image = Rails.root.join("db/fixtures/images/img_2.jpg").open
end