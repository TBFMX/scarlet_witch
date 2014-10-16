#!/bin/env ruby
# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# t.string   "title"
#     t.integer  "tipo"
#     t.string   "tiempo_preparacion"
#     t.string   "descripcion"

if User.count > 0
    User.delete_all
end
if Rol.count > 0
    Rol.delete_all
end
#######################ROLES######################################
#Rol.create(rol_name: 'rol_admin', admin: true, module_1: true, module_2: true, module_3: true, module_4: true, module_5: true)
@rol1 = Rol.new(rol_name: 'rol_admin', admin: true, module_1: true, module_2: true, module_3: true, module_4: true, module_5: true)
@rol1.save
#Rol.create(rol_name: 'tecnico', admin: false, module_1: true, module_2: true, module_3: true, module_4: true, module_5: true)
@rol2 = Rol.new(rol_name: 'tecnico', admin: false, module_1: true, module_2: true, module_3: true, module_4: true, module_5: true)
@rol2.save
###################################################################

######################USUARIOS#####################################
#User.create(username: 'admin', password: 'k4st3lJY!', email: 'admin@admin.com', rol_id: 1)
@usuario1 = User.new(username: 'admin', name: 'Admin', lastname: 'EYM', password: 'k4st3lJY!', email: 'admin@admin.com', rol_id: @rol1.id)
@usuario1.save
#User.create(username: 'demo', password: 'demo' ,  email: 'sebastian@tbf.mx', rol_id: 2)
@usuario2 = User.new(username: 'demo', name: 'demo', lastname: 'demo', password: 'demo12' ,  email: 'sebastian@tbf.mx', rol_id: @rol2.id)
@usuario2.save
###################################################################

##############################ARTICULOS#############################
if Articulo.count <= 0
	Articulo.create(title: 'vegetariana', tiempo_preparacion: '4 hrs', tipo: 1, descripcion: 'una lasagna mas')
	Articulo.create(title: 'Carne de Res', tiempo_preparacion: '4 hrs', tipo: 1, descripcion: 'una lasagna mas')
	Articulo.create(title: 'Salmon', tiempo_preparacion: '4 hrs', tipo: 1, descripcion: 'una lasagna mas')
	Articulo.create(title: 'Receta Secreta', tiempo_preparacion: '4 hrs', tipo: 1, descripcion: 'una lasagna mas')

	###ensaladas
	Articulo.create(title: 'Cesar', tiempo_preparacion: '4 hrs', tipo: 2, descripcion: 'una ensalada mas')
	Articulo.create(title: 'York', tiempo_preparacion: '4 hrs', tipo: 2, descripcion: 'una ensalada mas')
	Articulo.create(title: 'Pura Lechuga', tiempo_preparacion: '4 hrs', tipo: 2, descripcion: 'una ensalada mas')
	Articulo.create(title: 'TBF con champiñones', tiempo_preparacion: '4 hrs', tipo: 2, descripcion: 'una ensalada mas')

	###aderezos
	Articulo.create(title: 'Mayonesa', tiempo_preparacion: '4 hrs', tipo: 3, descripcion: 'una aderezo mas')
	Articulo.create(title: 'Green Mayo', tiempo_preparacion: '4 hrs', tipo: 3, descripcion: 'una aderezo mas')
	Articulo.create(title: 'Cesar', tiempo_preparacion: '4 hrs', tipo: 3, descripcion: 'una aderezo mas')
	Articulo.create(title: 'Ranch', tiempo_preparacion: '4 hrs', tipo: 3, descripcion: 'una aderezo mas')
end
######################################################################

############################Categorias################################
if Category.count <= 0
	@cat1 = Category.new(description: "Abarrotes")
	@cat2 = Category.new(description: "Carnes")
	@cat3 = Category.new(description: "Frutas")
	@cat4 = Category.new(description: "Limpieza")
	@cat5 = Category.new(description: "Verduras")

	@cat1.save
	@cat2.save
	@cat3.save
	@cat4.save
	@cat5.save
end
######################################################################

############################Subcategorias################################
if Subcategory.count <= 0
	@subcat1 = Subcategory.new(description: "Basicos")
	@subcat2 = Subcategory.new(description: "Pollo")
	@subcat3 = Subcategory.new(description: "Res")
	@subcat4 = Subcategory.new(description: "Botana")
	@subcat5 = Subcategory.new(description: "Galletas")
	@subcat6 = Subcategory.new(description: "Lacteos")
	@subcat7 = Subcategory.new(description: "Lateria")
	@subcat8 = Subcategory.new(description: "Leguminosas")
	@subcat9 = Subcategory.new(description: "Mariscos en Lata ")
	@subcat10 = Subcategory.new(description: "Panaderia")
	@subcat11 = Subcategory.new(description: "Platicos")
	@subcat12= Subcategory.new(description: "Quimicos")

	@subcat1.save
	@subcat2.save
	@subcat3.save
	@subcat4.save
	@subcat5.save
	@subcat6.save
	@subcat7.save
	@subcat8.save
	@subcat9.save
	@subcat10.save
	@subcat11.save
	@subcat12.save
end
######################################################################


############################Historial#################################
if HistorialDeCompra.count <= 0 && !@cat1.nil?
	HistorialDeCompra.create(nombre_generico: "Aceite" ,description: "Aceite cristal",cantidad: "1.5",unidad:"litros",precio:"37.5",multiplicador:"1",subcategory_id: @subcat1.id ,category_id: @cat1.id,origen: "Comercial Treviño Santa" )
	HistorialDeCompra.create(nombre_generico: "Levadura" ,description: "Levadura nevada oro",cantidad: "450" ,unidad: "gramos" , precio: "35.4" ,multiplicador: "1",subcategory_id: @subcat10.id ,category_id: @cat1.id ,origen: "Comercial Treviño Santa" )
	HistorialDeCompra.create(nombre_generico: "Galleta" ,description: "Ricanelas" ,cantidad: "652" ,unidad: "gramos" ,precio: "30.4" ,multiplicador: "1",subcategory_id: @subcat5.id ,category_id: @cat1.id ,origen: "Comercial Treviño Santa" )
	HistorialDeCompra.create(nombre_generico: "Queso Crema" ,description: "Queso Philadelphia" ,cantidad: "190" ,unidad: "gramos" ,precio: "28" ,multiplicador: "1",subcategory_id: @subcat6.id,category_id: @cat1.id ,origen: "Comercial Treviño Santa" )
	HistorialDeCompra.create(nombre_generico: "Harina Blanca" ,description: "Harina Blanca" ,cantidad: "10" ,unidad: "kilogramos",precio: "97.9",multiplicador: "1",subcategory_id: @subcat10.id ,category_id: @cat1.id ,origen: "Comercial Treviño Santa" )
	
	HistorialDeCompra.create(nombre_generico: "Palomitas" ,description: "Palomitas Act 2" ,cantidad: "6" ,unidad: "paquete" ,precio: "91.7" ,multiplicador: "1",subcategory_id: @subcat4.id,category_id: @cat1.id ,origen: "Comercial Treviño Santa" )
	HistorialDeCompra.create(nombre_generico: "Aceite" ,description: "Aceite Soya Soriana" ,cantidad: "1" ,unidad: "litros" ,precio: "25.75" ,multiplicador: "1",subcategory_id: @subcat1.id ,category_id: @cat1.id ,origen: "Soriana Hiper" )
	HistorialDeCompra.create(nombre_generico: "Cloro" ,description: "Cloro Blanqueador" ,cantidad: "3.8" ,unidad: "litros" ,precio: "20.5" ,multiplicador: "1",subcategory_id: @subcat12.id ,category_id: "@cat4.id",origen: "Soriana Hiper" )
	HistorialDeCompra.create(nombre_generico: "Bolsas para Basura" ,description: "Bolsas para Basura de soriana",cantidad: "",unidad: "pieza",precio: "50" ,multiplicador: "1",subcategory_id: @subcat11.id ,category_id: "@cat4.id" ,origen: "Soriana Hiper" )
	HistorialDeCompra.create(nombre_generico: "Brocoli",description: "Brocoli de soriana",cantidad: "0.48",unidad: "kilogramos" ,precio: "10.99" ,multiplicador: "1",subcategory_id: "" ,category_id: @cat5.id,origen: "Soriana Hiper" )

	HistorialDeCompra.create(nombre_generico: "Detergente" ,description: "Detergente Foca" ,cantidad: "1" ,unidad: "kilogramos",precio: "21.5" ,multiplicador: "1",subcategory_id: @subcat12.id ,category_id: "@cat4.id",origen: "Soriana Hiper" )
	HistorialDeCompra.create(nombre_generico: "Lata de elote" ,description: "Lata de elote en grano de soriana" ,cantidad: "400" ,unidad: "gramos" ,precio: "9.9" ,multiplicador: "1",subcategory_id: @subcat7.id ,category_id: @cat1.id ,origen: "Soriana Hiper" )
	HistorialDeCompra.create(nombre_generico: "Empanizador" ,description: "Empanizador de soriana" ,cantidad: "1",unidad: "bolsa",precio: "14",multiplicador: "1",subcategory_id: "",category_id: @cat1.id , origen: "Soriana Hiper" )
	HistorialDeCompra.create(nombre_generico: "Fabuloso",description: "Fabuloso",cantidad: "2",unidad: "litros" ,precio: "26",multiplicador: "1",subcategory_id: @subcat12.id ,category_id: "@cat4.id",origen: "Soriana Hiper" )
	HistorialDeCompra.create(nombre_generico: "Frijoles negros" ,description: "Frijoles negros Isadora",cantidad: "1",unidad: "kilogramos" ,precio: "8.9" ,multiplicador: "1",subcategory_id: @subcat8.id ,category_id: @cat1.id ,origen: "Soriana Hiper" )

	HistorialDeCompra.create(nombre_generico: "Papaya" ,description: "Papaya maradol",cantidad: "1" ,unidad: "kilogramos" ,precio: "27.9" ,multiplicador: "1",subcategory_id: "",category_id: "@cat3.id",origen: "Soriana Hiper" )
	HistorialDeCompra.create(nombre_generico: "lavatrastes" ,description: "Lavatrastes Salvo" ,cantidad: "0.75" ,unidad: "litros",precio: "19.9" ,multiplicador: "1",subcategory_id: @subcat12.id ,category_id: "@cat4.id" ,origen: "Soriana Hiper" )
	HistorialDeCompra.create(nombre_generico: "Milanesa de pollo" ,description: "Milanesa de pollo" ,cantidad: "1",unidad: "kilogramos" ,precio: "",multiplicador: "1",subcategory_id: @subcat2.id,category_id: @cat2.id,origen: "Soriana Hiper" )
	HistorialDeCompra.create(nombre_generico: "Pan de campo",description: "Pan de campo" ,cantidad: "1" ,unidad: "pieza" ,precio: "16" ,multiplicador: "1",subcategory_id: @subcat10.id ,category_id: @cat1.id ,origen: "Soriana Hiper" )
	HistorialDeCompra.create(nombre_generico: "Platano" ,description: "Platano Chiapas" ,cantidad: "1" ,unidad: "kilogramos" ,precio: "" ,multiplicador: "1",subcategory_id: "" ,category_id: "" ,origen: "Soriana Hiper" )

	HistorialDeCompra.create(nombre_generico: "Sardinas" ,description: "Sardinas con tomate lata" ,cantidad: "454" ,unidad: "gramos" ,precio: "22" ,multiplicador: "1",subcategory_id: @subcat9.id ,category_id: @cat1.id ,origen: "Soriana Hiper" )
	HistorialDeCompra.create(nombre_generico: "Tortillas de maiz" ,description: "Tortillas de maiz soriana" ,cantidad: "1" ,unidad: "kilogramos" ,precio: "12" ,multiplicador: "1",subcategory_id: @subcat1.id ,category_id: @cat1.id ,origen: "Soriana Hiper" )
	HistorialDeCompra.create(nombre_generico: "Yogurt" ,description: "Yogurt natural batido" ,cantidad: "1" ,unidad: "litros" ,precio: "25.75" ,multiplicador: "1",subcategory_id: @subcat6.id ,category_id: @cat1.id ,origen: "Soriana Hiper" )
	HistorialDeCompra.create(nombre_generico: "Totopos" ,description: "Totopos de maíz fritos" ,cantidad: "1" ,unidad: "kilogramos" ,precio: "28" ,multiplicador: "1",subcategory_id: @subcat1.id ,category_id: @cat1.id ,origen: "Soriana Hiper" )	
end
#########################################################################