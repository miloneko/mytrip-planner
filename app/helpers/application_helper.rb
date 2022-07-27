module ApplicationHelper
  def flash_class(type)
    { danger: 'red', notice: 'white', warning: 'yellow' }.fetch(type.to_sym)
  end

  def default_meta_tags
    {
      title: 'TripPlanner',
      description: '旅行先の思い出をシェアして、次に行きたい観光地を探せるサービスです',
      keywords: '旅行、海外旅行、旅行計画',
      charset: 'UTF-8',
      og: {
        title: 'TripPlanner',
        description: 'TripPlanner',
        type: 'website',
        url: [request.original_url],
        image: asset_url('ogp_logo.png'),
        locale: "ja_JP"
      },
      twitter: {
        site: '@wheretogo',
        card: 'summary',
        image: asset_url('ogp_logo.png')
      },
    }
  end
end
