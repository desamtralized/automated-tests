require "test/unit"
require "./calculadora.rb"

class CalculadoraTest < Test::Unit::TestCase
  def test_soma
    calculadora = Calculadora.new
    assert_equal(2, calculadora.soma(1, 1))
    assert_equal(5, calculadora.soma(2, 3))
    assert_equal(10, calculadora.soma(-20, 30))
  end

  def test_divisao
    calculadora = Calculadora.new
    assert_equal(6, calculadora.divisao(12, 2))
    assert_equal(30, calculadora.divisao(90, 3))
    assert_equal(0, calculadora.divisao(0, 1))
    assert_raise(ZeroDivisionError) {
      calculadora.divisao(1, 0)
    }
  end
end
