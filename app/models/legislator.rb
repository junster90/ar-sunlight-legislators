require_relative '../../db/config'

class Legislator < ActiveRecord::Base

  def self.rep_of_state(state)
  	self.where("title = ? AND state = ?",["Rep", state])
  end

  def self.sen_of_state(state)
  	self.where("title = ? AND state = ?",["Sen", state])
  end

  def self.senator(party)
  	self.where("title = ? AND party = ?",["Sen", party])
  end

  def self.representative(party)
  	self.where("title = ? AND party = ?",["Rep", party])
  end

  def getinfo(attribute)
  	self.attribute
  end

  def in_office?
  	self.in_office
  end

end

