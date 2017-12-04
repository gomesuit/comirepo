module Usr::BaseHelper
  def default_meta_tags
    {
      site: Settings.site.default.name,
      reverse: true,
      title: Settings.site.default.title,
      description: Settings.site.default.description,
      keywords: Settings.site.default.keywords,
      og: {
        title: :title,
        type: 'article',
        url: request.original_url,
        image: "#{root_url}#{asset_path('logo.png')}",
        site_name: Settings.site.default.name,
        description: :description,
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@comirepo',
        title: :title,
        description: :description,
        image: "#{root_url}#{asset_path('logo.png')}"
      }
    }
  end
end
