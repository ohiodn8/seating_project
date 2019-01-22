require 'csv'   

class ProjectController < ApplicationController
  def index
    @all = CSV.read("./row_column.csv")
	
	@group = (CSV.read("./row_column.csv")[0][0]).split(', ') + 
	(CSV.read("./row_column.csv")[4][1]).split(', ') + 
	(CSV.read("./row_column.csv")[6][7]).split(', ')
	
	@file = @group.sample
	
	@double = @group.sample(2)
  end
end
