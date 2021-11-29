class Article < ApplicationRecord
    belongs_to :user
    #valida que el los campos no estén vacíos
    validates_presence_of :title, message: "El título es obligatorio"
    validates_uniqueness_of :title, message: "El título ya está registrado"
    validates_presence_of :body, presence: true, message: "Debes ingresar información al artículo"
    validates_presence_of :title, length: {minimum:20}, message: "El artículo debe tener al menos 20 caracteres"

    before_create :set_visits_count

    def update_visits
        self.update(visits: self.visits + 1)
    end

    private

    def set_visits_count
        self.visits = 0
    end


end