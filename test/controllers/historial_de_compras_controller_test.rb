require 'test_helper'

class HistorialDeComprasControllerTest < ActionController::TestCase
  setup do
    @historial_de_compra = historial_de_compras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historial_de_compras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historial_de_compra" do
    assert_difference('HistorialDeCompra.count') do
      post :create, historial_de_compra: { cantidad: @historial_de_compra.cantidad, category_id: @historial_de_compra.category_id, description: @historial_de_compra.description, multiplicador: @historial_de_compra.multiplicador, nombre_generico: @historial_de_compra.nombre_generico, origen: @historial_de_compra.origen, precio: @historial_de_compra.precio, unidad: @historial_de_compra.unidad }
    end

    assert_redirected_to historial_de_compra_path(assigns(:historial_de_compra))
  end

  test "should show historial_de_compra" do
    get :show, id: @historial_de_compra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historial_de_compra
    assert_response :success
  end

  test "should update historial_de_compra" do
    patch :update, id: @historial_de_compra, historial_de_compra: { cantidad: @historial_de_compra.cantidad, category_id: @historial_de_compra.category_id, description: @historial_de_compra.description, multiplicador: @historial_de_compra.multiplicador, nombre_generico: @historial_de_compra.nombre_generico, origen: @historial_de_compra.origen, precio: @historial_de_compra.precio, unidad: @historial_de_compra.unidad }
    assert_redirected_to historial_de_compra_path(assigns(:historial_de_compra))
  end

  test "should destroy historial_de_compra" do
    assert_difference('HistorialDeCompra.count', -1) do
      delete :destroy, id: @historial_de_compra
    end

    assert_redirected_to historial_de_compras_path
  end
end
