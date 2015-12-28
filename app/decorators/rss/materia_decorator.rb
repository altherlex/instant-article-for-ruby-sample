module RSS
  class MateriaDecorator < Draper::Decorator
    include DatableDecorator

    delegate_all

    ELEMENTS = %w[strong em a img ol ul li p iframe figure figcaption]
    ATTRIBUTES = {
      'a'       => ['href', 'title', 'rel', 'target'],
      'img'     => ['alt', 'src', 'title', 'rel'],
      'iframe'  => ['src', 'width', 'height', 'frameborder'],
      'h2'      => ['class']
    }

    def corpo(custom_transformers = [])
      default_transformers = [
        InfograficoTransformer.new(model),
        RSS::ImagemTransformer.new(model),
        RSS::VideoTransformer.new(model.conteudos_embedados),
        RSS::VideoExternoTransformer.new(model.conteudos_embedados),
        RSS::GaleriaMultimidiaTransformer.new(model.conteudos_embedados),
        RSS::SoundCloudTransformer.new(model),
        RSS::StorifyEmbedTransformer.new(model.conteudos_embedados)
      ]

      transformers = custom_transformers + default_transformers
      options = { elements: ELEMENTS, attributes: ATTRIBUTES, transformers: transformers }
      Sanitize.clean(model.corpo.to_s || "", options).html_safe
    end

    def subtitulo
      Sanitize.clean(model.subtitulo, elements: %w[em strong]).html_safe if model.subtitulo.present?
    end
  end
end
