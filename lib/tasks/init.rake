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
end
