#encoding: UTF-8

xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Veja"
    xml.description "VEJA.com - Reportagens exclusivas, informação e opinião em blogs, colunas e vídeos"
    xml.link "http://www.veja.abril.com.br"
    xml.language "pt-br"
    xml.lastBuildDate Time.now.iso8601

    for materia in @materias
      xml.item do
        xml.title materia.titulo
        xml.link materia.to_url
        xml.guid materia.id.split('/').last
        xml.description materia.meta_description
        xml.pubDate materia.disponibilizacao['data']
        xml.author materia.autor || "VEJA.com"
        xml.tag! "content:encoded" do
          xml.cdata! render partial: 'feed/materia', locals: { materia: materia }
        end
      end
    end
  end
end
