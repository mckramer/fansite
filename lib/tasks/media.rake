namespace :db do
  namespace :seed do
    desc "Create supported media, requires YouTube"    
    task :media => :environment do

      youtube = MediaProvider.find_by_name('YouTube')
    
      butterflies = Medium.create!(
        name: "Butterflies",
        teaser: "",
        lyrics: "",
        analysis: "",
        media_provider: youtube,
        provider_media_id: ""
      )
      
    end
  end
end