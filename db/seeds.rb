# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

##########
# Security
##########

# Default admin user
admin= User.create(:username => "reciveci", :email => "info@reciveci.ec", :password => "admin2016", :password_confirmation => "admin2016", :role => "administrador")


##########
# Separate
##########

# Papel y Cartón
cat = Category.new(:name => "Papel y Cartón",:description => "Papel y Cartón", :image_name => "papel.png", :column => 1, :waste_type => "REC")
cat.save

  subcat = Subcategory.new(:category => cat, :name => "Papel",:description => "Papel", :image_name => "papel.png", :examples => "- Papel Bond
- Revistas, periódicos
- Cuadernos, libros", :instructions => "Tiene que estar limpio y seco")
  subcat.save

  subcat = Subcategory.new(:category => cat, :name => "Cartón",:description => "Cartón", :image_name => "carton.png", :examples => "- Carpetas
- Cajas de huevos
- Cajas de cereales
- Cajas de te e infusiones
- Cajas de productos", :instructions => "Tiene que estar limpio y seco")
  subcat.save

#Plásticos
cat = Category.new(:name => "Plásticos",:description => "Plásticos", :image_name => "plastico.png", :column => 2, :waste_type => "REC")
cat.save

  subcat = Subcategory.new(:category => cat, :name => "Envases plásticos",:description => "Envases plásticos", :image_name => "plastico_envase.png", :examples => "- Shampoo / aseo personal
- Botellas de bebidas
- Vajilla plástica
- Envases de detergente
- Envases de yogurt", :instructions => "Tienen que estar enjuagado")
  subcat.save

  subcat = Subcategory.new(:category => cat, :name => "Fundas plásticas",:description => "Fundas plásticas", :image_name => "plastico_funda.png", :examples => "- Fundas de supermercado
- Fundas del pan
- Fundas de basura", :instructions => "Tiene que estar limpio")
  subcat.save

#Chatarra
cat = Category.new(:name => "Chatarra",:description => "Chatarra", :image_name => "chatarra.png", :column => 2, :waste_type => "REC")
cat.save

subcat = Subcategory.new(:category => cat, :name => "Envases de metal",:description => "Envases de metal", :image_name => "chatarra.png", :examples => "- Enlatados de bebidas
- Latas de atún
- Conservas
- Aerosoles", :instructions => "Debe estar enjuagado")
subcat.save


#Vidrio
cat = Category.new(:name => "Vidrio",:description => "Vidrio", :image_name => "vidrio.png", :column => 1, :waste_type => "REC")
cat.save

subcat = Subcategory.new(:category => cat, :name => "Envases de vidrio",:description => "Envases de vidrio", :image_name => "vidrio_envase.png", :examples => "- Envases de mermelada
- Envases de bebidas
- Envases de salsas", :instructions => "Tiene que estar enjuagado. No debe estar roto o quebrado")
subcat.save

#Tetrapack
cat = Category.new(:name => "Tetrapak ",:description => "Tetrapak ", :image_name => "tetrapack.png", :column => 1, :waste_type => "REC")
cat.save

subcat = Subcategory.new(:category => cat, :name => "Envases de tetrapack",:description => "Envases de tetrapack", :image_name => "tetrapack.png", :examples => "- Envases de leche
- Envases de avena
- Envases de jugo", :instructions => "Debe estar enjuagado")
subcat.save

# Ordinarios
cat = Category.new(:name => "Ordinarios",:description => "Ordinarios", :image_name => "ordinarios.png", :column => 1, :waste_type => "NRE")
cat.save

subcat = Subcategory.new(:category => cat, :name => "Papel higiénico",:description => "Papel higiénico", :image_name => "papel_higienico.png", :examples => "", :instructions => "No reciclable")
subcat.save

subcat = Subcategory.new(:category => cat, :name => "Toallas higiénicas y pañales",:description => "Toallas higiénicas y pañales", :image_name => "panial.png", :examples => "", :instructions => "No reciclable")
subcat.save

subcat = Subcategory.new(:category => cat, :name => "Espuma flex / estereofón",:description => "Espuma flex / estereofón", :image_name => "espuma_flex.png", :examples => "", :instructions => "No reciclable")
subcat.save

subcat = Subcategory.new(:category => cat, :name => "Residuos de cocina",:description => "Residuos de cocina", :image_name => "manzana.png", :examples => "", :instructions => "No reciclable")
subcat.save


########
# Cities
########
city = City.new(:name => "Quito")
city.save


##############
# Affiliations
##############

affiliation = Affiliation.new(:name => "Asociación SONREÍR", :city => city)
affiliation.save

###############
# Waste Pickers
###############
wp = WastePicker.new(:name => "Vero",
:affiliation => affiliation,
:birth_date => Date.new(1990,4,29),
:start_date => Date.new(2000,11,1),
:background => "	Madre de dos hijas",
:message => "Darles un mejor bienestar a mis hijas")
wp.save

wp = WastePicker.new(:name => "Sonia",
:affiliation => affiliation,
:birth_date => Date.new(1987,10,14),
:start_date => Date.new(1998,11,1),
:background => "	Madre de tres hijos. Empezó a reciclar a los 10 años",
:message => "Mejor porvenir")
wp.save

wp = WastePicker.new(:name => "Vanessa",
:affiliation => affiliation,
:birth_date => Date.new(1996,12,5),
:start_date => Date.new(2007,11,1),
:background => "	Madre de un hijo",
:message => "Por un planeta limpio y por el futuro de mi hijo")
wp.save

wp = WastePicker.new(:name => "Blanca",
:affiliation => affiliation,
:birth_date => Date.new(1977,5,5),
:start_date => Date.new(1995,11,1),
:background => "Madre de tres hijos",
:message => "Futuro mejor, cambio de vida")
wp.save

wp = WastePicker.new(:name => "Gladys",
:affiliation => affiliation,
:birth_date => Date.new(1980,12,29),
:start_date => Date.new(2000,11,1),
:background => "	Madre de tres hijos",
:message => "Darles un futuro mejor a mis hijos y terminar mi casa")
wp.save

wp = WastePicker.new(:name => "Carmen",
:affiliation => affiliation,
:birth_date => Date.new(1940,11,23),
:start_date => Date.new(1985,11,1),
:background => "	Madre de tres hijos",
:message => "Vivir bien, vivir mejor")
wp.save

wp = WastePicker.new(:name => "Johana",
:affiliation => affiliation,
:birth_date => Date.new(1988,3,27),
:start_date => Date.new(1999,11,1),
:background => "	Madre de cuatro hijos",
:message => "Tener un taller de corte y confección")
wp.save

wp = WastePicker.new(:name => "Mercedes",
:affiliation => affiliation,
:birth_date => Date.new(1961,7,2),
:start_date => Date.new(1985,11,1),
:background => "	Madre de ocho hijos",
:message => "	Hacer mi casa, tener una economía y dar estudio a los hijos")
wp.save

wp = WastePicker.new(:name => "María",
:affiliation => affiliation,
:birth_date => Date.new(1958,7,9),
:start_date => Date.new(1977,11,1),
:background => "	Madre de ocho hijos",
:message => "Terminar mi casa y que tenga más vida para hacerle estudiar a mi hijo")
wp.save

wp = WastePicker.new(:name => "María",
:affiliation => affiliation,
:birth_date => Date.new(1995,7,23),
:start_date => Date.new(2000,11,1),
:background => "	Madre de un hijo",
:message => "Luchar y seguir adelante. Superar todos los obstáculos de la vida")
wp.save
