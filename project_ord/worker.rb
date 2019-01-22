require 'csv'
require 'matrix'

class Worker
  HEADER = 'TEST: Ordway Application Trial :CHECK'
  
  def group
    (CSV.read("./row_column.csv")[0][0]).split(', ') + 
	(CSV.read("./row_column.csv")[4][1]).split(', ') + 
	(CSV.read("./row_column.csv")[6][7]).split(', ')    
  end
  
  def single
    file = group.sample
  end 
  
  def double
    group.sample(2)
  end
  
  def pass
    (0...12).map { (65 + rand(54)).chr }.join
  end   
  
  def initialize(format=nil)
    @format   = format
  end
  
  def process
    print
  end

  private  
  def print
    case @format
    when 'check'
      puts HEADER
    when 'trigger'
	  p Matrix[*CSV.read("./row_column.csv")]
	when 'south'
	  p group.uniq
    when 'north'
      p single	  
    when 'west'
      p double	
	when 'password'
      puts pass 	
	end
  end
end
