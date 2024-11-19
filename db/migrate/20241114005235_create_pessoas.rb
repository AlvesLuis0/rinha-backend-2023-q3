# frozen_string_literal: true

class CreatePessoas < ActiveRecord::Migration[7.1]
  def change
    create_table :pessoas, id: :uuid do |t|
      t.string :apelido
      t.string :nome
      t.date :nascimento
      t.string :stack, array: true
    end

    add_index :pessoas, :id
    add_index :pessoas, :apelido
  end
end
