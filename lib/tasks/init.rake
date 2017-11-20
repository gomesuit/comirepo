namespace :init do
  desc 'description'
  task :label => :environment do
    Item.all.each do |item|
      match = item.title.match(/.+\((.+?)\)/)
      if match
        label = Label.find_or_initialize_by(name: match[1])
        pp label
        item.update!(label: label)
      end
    end
  end

  task :free => :environment do
    Item.all.each do |item|
      reg = /(\d+年\d+月\d+日).*までの期間限定無料/
      match = item.introduction.match(reg)
      if match
        pp match[1]
        free_last_date = Date.strptime(match[1],'%Y年%m月%d日')
        item.update!(free_last_date: free_last_date)
      end
    end
  end
end
