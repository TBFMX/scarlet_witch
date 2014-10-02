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
if Articulo.count <= 0
	Articulo.create(title: 'vegetariana', tiempo_preparacion: '4 hrs', tipo: 1, descripcion: 'una lasagna mas')
	Articulo.create(title: 'vegetariana2', tiempo_preparacion: '4 hrs', tipo: 1, descripcion: 'una lasagna mas')
	Articulo.create(title: 'vegetariana3', tiempo_preparacion: '4 hrs', tipo: 1, descripcion: 'una lasagna mas')
	Articulo.create(title: 'vegetariana4', tiempo_preparacion: '4 hrs', tipo: 1, descripcion: 'una lasagna mas')

	###ensaladas
	Articulo.create(title: 'ensaladas', tiempo_preparacion: '4 hrs', tipo: 2, descripcion: 'una ensalada mas')
	Articulo.create(title: 'ensaladas2', tiempo_preparacion: '4 hrs', tipo: 2, descripcion: 'una ensalada mas')
	Articulo.create(title: 'ensaladas3', tiempo_preparacion: '4 hrs', tipo: 2, descripcion: 'una ensalada mas')
	Articulo.create(title: 'ensaladas4', tiempo_preparacion: '4 hrs', tipo: 2, descripcion: 'una ensalada mas')

	###aderezos
	Articulo.create(title: 'aderezos', tiempo_preparacion: '4 hrs', tipo: 3, descripcion: 'una aderezo mas')
	Articulo.create(title: 'aderezos2', tiempo_preparacion: '4 hrs', tipo: 3, descripcion: 'una aderezo mas')
	Articulo.create(title: 'aderezos3', tiempo_preparacion: '4 hrs', tipo: 3, descripcion: 'una aderezo mas')
	Articulo.create(title: 'aderezos4', tiempo_preparacion: '4 hrs', tipo: 3, descripcion: 'una aderezo mas')
end
