class Experience < ActiveRecord::Base
  belongs_to :worklist
  belongs_to :job
end
