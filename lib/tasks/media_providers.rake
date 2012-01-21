namespace :db do
  namespace :seed do
    desc "Create supported media providers"    
    task :media_providers => :environment do
      
      puts 'Begin to create media providers...'
    
      # hulu
      puts '> Create hulu'
      hulu = MediaProvider.create!(
        :name => "hulu",
        :homepage_url => "http://www.hulu.com/",
        :source_url => "http://www.hulu.com/watch/[id].jpg",
        :thumbnail_url => "http://www.hulu.com/watch/[id].jpg",
        :content_url => "http://www.hulu.com/watch/[id]"
      )
      
      # imgur
      puts '> Create imgur'
      imgur = MediaProvider.create!(
        :name => "imgur",
        :homepage_url => "http://imgur.com/",
        :source_url => "http://i.imgur.com/[id].jpg",
        :thumbnail_url => "http://i.imgur.com/[id]s.jpg",
        :content_url => "http://imgur.com/gallery/[id]"
      )
      
=begin
      # twitpic
      twitpic = MediaProvider.create!(
      
      )
=end

=begin
      # pic.twitter
      twitter = MediaProvider.create!(
      
      )
=end

      # YouTube
      puts '> Create YouTube'
      youtube = MediaProvider.create!(
        :name => "YouTube",
        :homepage_url => "http://www.youtube.com/",
        :source_url => "http://youtube.com/embed/[id]",
        :thumbnail_url => "http://img.youtube.com/vi/[id]/2.jpg",
        :content_url => "http://www.youtube.com/watch?v=[id]"
      )
      
      puts 'Finished'

    end
  end
end