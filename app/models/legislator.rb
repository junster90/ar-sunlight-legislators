require_relative '../../db/config'

class Legislator < ActiveRecord::Base

  def self.rep_of_state(state)
  	self.where("title = ? AND state = ?",["Rep", state])
  end

  def self.sen_of_state(state)
  	self.where("title = ? AND state = ?",["Sen", state])
  end

end

