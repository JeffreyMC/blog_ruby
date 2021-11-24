class Article < ApplicationRecord
    #valida que el los campos no estén vacíos
    validates_presence_of :title, message: "El título es obligatorio"
    validates_uniqueness_of :title, message: "El título ya está registrado"
    validates_presence_of :body, presence: true, message: "Debes ingresar información al artículo"
    validates_presence_of :title, length: {minimum:20}, message: "El artículo debe tener al menos 20 caracteres"
end