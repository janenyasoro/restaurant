require 'sinatra'
require 'orders'
require 'order_store'
require 'yaml/store'

store = OrderStore.new('tables.yml')

get('/') do
	 
	 @order = store.all
  
	 erb :index
	
end
get('/order') do
	erb :order 
end
post('/order/create') do
	@order = Order.new
	@order.order1 = params['order1']
	@order.order2 = params['order2']
	@order.order3 = params['order3']
	store.save(@order)
	erb :show
	
end
get('/order/:tableno') do
	tableno = params['tableno'].to_ipatch('/order/create') do
	@order=store.find(tableno)
	erb :show
end
