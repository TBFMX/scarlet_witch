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

