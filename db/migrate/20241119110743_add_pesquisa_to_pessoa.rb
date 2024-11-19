# frozen_string_literal: true

class AddPesquisaToPessoa < ActiveRecord::Migration[7.1]
  def change
    add_column :pessoas, :pesquisa, :virtual, type: :text, as: 'apelido || nome || stack', stored: true
    add_index :pessoas, :pesquisa
  end
end
