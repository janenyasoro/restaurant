require 'yaml/store'
class OrderStore
	def initialize(file_name)
		@store = YAML::Store.new(file_name)
	end
	def find(tableno)
		@store.transaction do
			@store[tableno]
		end
	end
	def all
		@store.transaction do
			@store.roots.map { |tableno| @store[tableno]}
		end
	end
	def save(order)  
		@store.transaction  do 
			unless order.tableno
				highest_tableno = @store.roots.max || 0
				order.tableno = highest_tableno + 1
			end
		@store[order.tableno] = order
	 
	    end
	end
end