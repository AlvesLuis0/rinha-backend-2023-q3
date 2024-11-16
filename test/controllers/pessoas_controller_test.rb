# frozen_string_literal: true

require 'test_helper'

class PessoasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pessoa = pessoas(:one)
  end

  test 'should get index' do
    get pessoas_url, as: :json
    assert_response :success
  end

  test 'should create pessoa' do
    assert_difference('Pessoa.count') do
      post pessoas_url,
           params: { pessoa: { apelido: @pessoa.apelido, nascimento: @pessoa.nascimento, nome: @pessoa.nome, stack: @pessoa.stack } }, as: :json
    end

    assert_response :created
  end

  test 'should show pessoa' do
    get pessoa_url(@pessoa), as: :json
    assert_response :success
  end
end
