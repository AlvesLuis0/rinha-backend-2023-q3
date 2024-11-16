# frozen_string_literal: true

class PessoasController < ApplicationController
  before_action :validate_pessoa_params, only: %i[create]
  before_action :set_pessoa, only: %i[show]

  # GET /pessoas
  def index
    @pessoas = Pessoa.all

    render json: @pessoas
  end

  # GET /pessoas/1
  def show
    render json: @pessoa
  end

  # POST /pessoas
  def create
    @pessoa = Pessoa.new(pessoa_params)

    if @pessoa.save
      render json: @pessoa, status: :created, location: @pessoa
    else
      head :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pessoa
    @pessoa = Pessoa.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pessoa_params
    params.require(:pessoa).permit(:apelido, :nome, :nascimento, stack: [])
  end

  def validate_pessoa_params
    pessoa = pessoa_params
    head :bad_request unless [pessoa[:apelido], pessoa[:nome]].all? { |item| item.is_a? String }
    head :bad_request unless pessoa[:stack].nil? || pessoa[:stack]&.all? { |item| item.is_a? String }
    begin
      Date.parse pessoa[:nascimento]
    rescue StandardError
      head :bad_request
    end
  end
end
