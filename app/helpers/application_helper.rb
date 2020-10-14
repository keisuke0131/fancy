module ApplicationHelper
  def default_meta_tags
    {
      site: 'Fancy',
      title: '彼女なんて誰でも作れる',
      reverse: true,
      charset: 'utf-8',
      description: '彼女ができなくて悩んでませんか？ Fancyでは彼女を作るために必要なノウハウを徹底解説しています。彼女は欲しいけど、どうすればいいのかわからないし焦っているという方は登録必須です！',
      keywords: '彼女欲しい',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('favicon.ico') }
      ],
      og: {
        site_name: 'Fancy',
        title: '彼女なんて誰でも作れる',
        description: '彼女ができなくて悩んでませんか？ Fancyでは彼女を作るために必要なノウハウを徹底解説しています。彼女は欲しいけど、どうすればいいのかわからないし焦っているという方は登録必須です！', # もしくは description: :description
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      }
    }
  end
end