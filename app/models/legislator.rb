require_relative '../../db/config'

class Legislator < ActiveRecord::Base

  def self.rep_of_state(state)
  	self.where("title = 'Rep' AND state = ?",[state])
  end

  def self.sen_of_state(state)
  	self.where("title = 'Sen' AND in_office = '1' AND state = ?",[state])
  end

  def self.senator(party)
  	self.where("title = 'Sen' AND party = ?",[party])
  end

  def self.representative(party)
  	self.where("title = 'Rep' AND party = ?",[party])
  end

  def name
  	"#{self.firstname} #{self.lastname}"
  end

  def self.getinfo(attribute,firstname,lastname)
  	selection = self.find_by(firstname: firstname, lastname: lastname)
  	selection[attribute]
  end

  def self.in_office?(firstname,lastname)
  	selection = self.find_by(firstname: firstname, lastname: lastname)
	  	if selection[:in_office] == 1
	  		true
	  	else
	  		false
	  	end
  	
  end

end

