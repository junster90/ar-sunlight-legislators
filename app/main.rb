require_relative './models/legislator'

def state(state)
	all = Legislator.where("in_office = 1").where("state=?",[state]).order("lastname")
	senators =[]
	representatives = []
	result = all.each do |legislator|
		if legislator.title == "Sen"
			senators << legislator
		elsif legislator.title == "Rep"
			representatives << legislator
		end
	end

		puts "Senators:"
		senators.each do |senators|
			puts "  #{senators.name} (#{senators.party})"
		end
		puts "Representatives:"
		representatives.each do |reps|
			puts "  #{reps.name} (#{reps.party})"
		end
end


def gender(input)
	all = Legislator.where("in_office = 1").where("gender = ?",[input])
	senators = []
	representatives = []
	result = all.each do |legislator|
		if legislator.title == "Sen"
			senators << legislator
		elsif legislator.title == "Rep"
			representatives << legislator
		end
	end

	gender = ""
	if input == "M"
		gender = "Male"
	elsif input == "F"
		gender = "Female"
	end

	percent = all.count.to_f * 100 / Legislator.where("in_office = 1").count 

	puts "#{gender} Senators: #{senators.count} (#{percent.round}%)"
	puts "#{gender} Representatives: #{representatives.count} (#{percent.round}%)"

end

def state_info

	list_of_states = Legislator.uniq.pluck(:state)
		states = []
  list_of_states.each do |s|
    states << [s, Legislator.where('state = ?',s.to_s).where('in_office =?', "1").where('title = ?', 'Sen').count, Legislator.where('state = ?',s.to_s).where('in_office =?', "1").where('title = ?', 'Rep').count]
  end

  states.sort_by!{|x|-(x[1]+x[2])}

  states.each do |x|
  	puts "#{x[0]}: #{x[1]} Senators, #{x[2]} Representatives"
  end
end

def total
	puts "Senators: #{Legislator.where('title= ?','Sen').count}"
	puts "Representatives: #{Legislator.where('title= ?','Rep').count}"
end

def delete
	Legislator.destroy_all(:in_office => "0")
end
