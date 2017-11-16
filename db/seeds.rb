fourteeners_attributes = [ 
	{ name: 'Grays Peak', elevation: 14027 },
	{ name: 'Torreys Peak', elevation: 14148 },
	{ name: 'Mount Sherman', elevation: 500 }
]

trails_data = [
  	{
  		attributes: {name: 'Grays and Torreys trail', distance: 12, elevation_gain: 2000 },
	    fourteener_names: ['Grays Peak', 'Torreys Peak']
	},

    {
    	attributes: { name: 'ol Sherman', distance: 3.87, elevation_gain: 500 },
    	fourteener_names: ['Mount Sherman']
    }
]

fourteeners_count = 0
fourteeners_attributes.each do |attributes|
	Fourteener.create!(attributes)
	fourteeners_count += 1
end
puts "created #{fourteeners_count} fourteeners"


trails_count = 0
trails_data.each do |datum|
	trail = Trail.create!(datum[:attributes])

	trail.fourteeners = datum[:fourteener_names].map{ |name| Fourteener.find_by(name: name) }

	trails_count += 1
end
puts "created #{trails_count} trails"