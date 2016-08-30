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

#default Colors
Color.create(:nombre => "amarillo", :codigo => "#AEB404")
Color.create(:nombre => "azul", :codigo => "#0000FF")
Color.create(:nombre => "cafe", :codigo => "#8B4513")
Color.create(:nombre => "celeste", :codigo => "#00ffff")
Color.create(:nombre => "fucsia", :codigo => "#FF00FF")
Color.create(:nombre => "purpura", :codigo => "#800080")
Color.create(:nombre => "verde Oscuro", :codigo => "#008000")
Color.create(:nombre => "verde Claro", :codigo => "#00b300")
Color.create(:nombre => "rojo", :codigo => "#FF0000")
Color.create(:nombre => "rosa", :codigo => "#FF69B4")
Color.create(:nombre => "naranja", :codigo => "#DF7401")
Color.create(:nombre => "oro", :codigo => "#DAA520")



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
