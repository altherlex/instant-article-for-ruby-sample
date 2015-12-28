class MateriaController < ApplicationController

  tipo_recurso :materia

  alias_method :materia, :resource

  def index
    @materias = Materia.all_sync(build_options, callback_for_each_index)
    raise @materias if @materias.is_a? ApiResponse::Error

    set_response_headers(@materias)

    respond_to do |format|
      format.html { render }
      format.xhr { render :layout => false, :template => "materia/_page.html" }
      format.rss do
        @materias = RSS::MateriaDecorator.decorate_collection(@materias)
        render :layout => false
      end
    end
  end

  private
  def build_options
    options = area.options ? ParameterResolver.resolve(area.options.dup, params) : {}
    options[:startPage] = params['pagina']
    options
  end

  def callback_for_each_index
    Proc.new do |materia, &done|
      resources = []
      resources << DeferrableAction.new(materia, :load_capa!)
      resources << materia.corpo.conteudos
      DefaultIterator.map!(resources.flatten) do |results|
        results.shift
        results.each do |result|
          materia.conteudos_embedados[result.id] = result if result
        end
        done.call
      end
    end
  end
end
