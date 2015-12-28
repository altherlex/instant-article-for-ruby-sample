module DatableDecorator
  def data_disponibilizacao(format = '%d/%m/%Y às %H:%M')
    model.disponibilizacao_data.localtime.strftime(format) if model.disponibilizacao_data
  end

  def data_ultima_atualizacao(format = '%d/%m/%Y às %H:%M')
    model.ultima_atualizacao_data.localtime.strftime(format)
  end

  def atualizado?
    return false unless model.disponibilizacao_data
    model.ultima_atualizacao_data > model.disponibilizacao_data
  end
end
