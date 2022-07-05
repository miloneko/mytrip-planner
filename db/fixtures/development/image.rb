Sample.seed do |sample|
  sample.id = 1
  sample.image = Rails.root.join("db/fixtures/images/Image1.jpg").open
end