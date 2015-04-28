# coding: utf-8
# calculadora_steps.rb

require_relative "../../../calculadora"
Dado(/^os argumentos "(.*?)" e "(.*?)"$/) do |arg1, arg2|
  @calculadora = Calculadora.new
  @arg1 = arg1.to_i
  @arg2 = arg2.to_i
end

Quando(/^efetuarmos a (soma|divisão)$/) do |arg1|
  if arg1 == "soma"
    @resultado = @calculadora.soma(@arg1, @arg2)
  else
    begin
      @resultado = @calculadora.divisao(@arg1, @arg2)
    rescue
      @resultado = nil
    end
  end
end

Então(/^o resultado será "(.*?)"$/) do |arg1|
  raise "Deu ruim, resultado obtido foi '#{@resultado}'" unless @resultado == arg1.to_i
end

Então(/^veremos uma mensagem de erro$/) do
  raise "Deu ruim, sem mensagem de erro" unless @resultado == nil
end
