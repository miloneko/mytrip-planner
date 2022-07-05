Sample.seed do |sample|
  sample.id = 1
  sample.image = Rails.root.join("public/images/Image1.jpg").open
end