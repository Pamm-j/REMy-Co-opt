CartItem.destroy_all
Product.destroy_all
Category.destroy_all
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("users")
ActiveRecord::Base.connection.reset_pk_sequence!("products")
ActiveRecord::Base.connection.reset_pk_sequence!("categories")
ActiveRecord::Base.connection.reset_pk_sequence!("cart_items")

u0 = User.create(
  email:'bobby@mars.mc', 
  full_name:"Roberta Draper", 
  password:"123456", 
  address_1:"14 Innis Deep", 
  address_2:"LondresNova, Mars MA432"
)
u1 = User.create(
  email:'amos@rocinante.roci',
  full_name:"Amos Burton", 
  password:"123456",
  address_1:"Dont Ask", 
  address_2:"Baltimore, Maryland 21201"
)
u2 = User.create(
  email:'prax@soyfarmers.gn', 
  full_name:"Praxidike Meng", 
  password:"123456", 
  address_1:"Soy Fields", 
  address_2:"Djuna, Ganymede GA12"
)
u3 = User.create(
  email:'president@transportunion.bt', 
  full_name:"Camina Drummer ", 
  password:"123456", 
  address_1:"Taicho Station", 
  address_2:"Apt 12, Corridor 1, Level 1"
)


c1 = Category.create(title:"Cycle", description:"From e-bikes to mountain bikes, and bikepacking to gravel grinding, co-opt members can save more getting geared up for any terrain.")
c2 = Category.create(title:"Travel", description:"Every epic adventure starts with packing and planning. We’ve got everything you need to make that a joy and a breeze.")
c3 = Category.create(title:"Camp & Hike", description:"From overlanding to day camping, the co-op can get you the right gear to get you out there in no time.")
c1.photo.attach(io: open('https://my-co-opt-seed.s3.us-west-1.amazonaws.com/cat-spash/two-bikes.jpg'), filename:'cycle-splash.jpg')
c2.photo.attach(io: open('https://my-co-opt-seed.s3.us-west-1.amazonaws.com/cat-spash/boat-bag.jpg'), filename:'travel-splash.jpg')
c3.photo.attach(io: open('https://my-co-opt-seed.s3.us-west-1.amazonaws.com/cat-spash/sleep-roraima.jpg'), filename:'hike-splash.jpg')

# pc means Product - Cycle
pc1 = Product.create(
  name:'Devote Advanced 2',
  category_id: c1.id,
  description: "Travel by two wheels into new terrain to satiate your true sense of adventure, plus bring all your gear for some “prepared-for-anything” peace of mind. Available in lightweight Advanced-Grade Composite frame and fork to meet the needs of performance and endurance riders alike. Because control is the name of the game, our OverDrive steerer creates sound and precise steering, while the D-Fuse handlebar smooths out the ride, stocked with Liv All-Condition handlebar tape to keep you connected. Select models come equipped with vibration absorbing D-Fuse seatpost, or dropper seatpost. And finally, a wheelset specifically built for all-weather performance and unpredictable terrain makes the steadfast Devote your top pick for finishing any tough ride or race.",
  price:2700.00,
  colors: ["Rosewood", "DarkEclipse"],
  sizes: ['XS', 'S', 'M', 'L'],
  brand: 'Liv'
)
pc1.photos.attach(io: open('https://my-co-opt-seed.s3.us-west-1.amazonaws.com/bikes/da2-1.jpeg'), filename:'da2-1.jpeg')
pc1.photos.attach(io: open('https://my-co-opt-seed.s3.us-west-1.amazonaws.com/bikes/da2-2.webp'), filename:'da2-2.webp')

pc2 = Product.create(
  name:'Devote Advanced 1',
  category_id: c1.id,
  description: "Travel by two wheels into new terrain to satiate your true sense of adventure, plus bring all your gear for some “prepared-for-anything” peace of mind. Available in lightweight Advanced-Grade Composite frame and fork to meet the needs of performance and endurance riders alike. Because control is the name of the game, our OverDrive steerer creates sound and precise steering, while the D-Fuse handlebar smooths out the ride, stocked with Liv All-Condition handlebar tape to keep you connected. Select models come equipped with vibration absorbing D-Fuse seatpost, or dropper seatpost. And finally, a wheelset specifically built for all-weather performance and unpredictable terrain makes the steadfast Devote your top pick for finishing any tough ride or race.",
  price:3550.00,
  colors: ["DarkGreen", "OceanBlue"],
  sizes: ['XS', 'S', 'M', 'L'],
  brand: 'Liv'
)
pc2.photos.attach(io: open('https://my-co-opt-seed.s3.us-west-1.amazonaws.com/bikes/da1-1.jpeg'), filename:'da1-1.jpeg')
pc2.photos.attach(io: open('https://my-co-opt-seed.s3.us-west-1.amazonaws.com/bikes/da1-2.jpeg'), filename:'a1-2.jpeg')


pc3 = Product.create(
  name:'Devote Advanced Pro',
  category_id: c1.id,
  description: "Travel by two wheels into new terrain to satiate your true sense of adventure, plus bring all your gear for some “prepared-for-anything” peace of mind. Available in lightweight Advanced-Grade Composite frame and fork to meet the needs of performance and endurance riders alike. Because control is the name of the game, our OverDrive steerer creates sound and precise steering, while the D-Fuse handlebar smooths out the ride, stocked with Liv All-Condition handlebar tape to keep you connected. Select models come equipped with vibration absorbing D-Fuse seatpost, or dropper seatpost. And finally, a wheelset specifically built for all-weather performance and unpredictable terrain makes the steadfast Devote your top pick for finishing any tough ride or race.",
  price:6400.00,
  colors: ["Eggplant", "Mushroom"],
  sizes: ['XS', 'S', 'M', 'L'],
  brand: 'Liv'
)

pc3.photos.attach(io: open('https://my-co-opt-seed.s3.us-west-1.amazonaws.com/bikes/dap-2.jpeg'), filename:'dap-2.jpeg')
pc3.photos.attach(io: open('https://my-co-opt-seed.s3.us-west-1.amazonaws.com/bikes/dap-1.jpeg'), filename:'dap-1.jpeg')


ci1 = CartItem.create!(
  quantity: 1,
  product_id: pc1.id,
  shopper_id: u0.id,
  size: 'L',
  color: 'Rosewood',
  delivery_type: 'delivery'
)
ci1 = CartItem.create!(
  quantity: 1,
  product_id: pc2.id,
  shopper_id: u0.id,
  size: 'L',
  color: 'Rosewood',
  delivery_type: 'delivery'
)

