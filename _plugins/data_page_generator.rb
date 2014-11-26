# Generate pages from individual records in yml files
# (c) 2014 Adolfo Villafiorita
# Distributed under the conditions of the MIT License

module Jekyll

  class DataPage < Page
    def initialize(site, base, dir, data, name, template, dot_file, md_file)
      @site = site
      @base = base
      @dir = dir
      @name = sanitize_filename(name) + ".html"

      puts "PROCEESING #{data.inspect}"
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), template + ".html")
      self.data.merge!(data)
      puts "DOT #{dot_file}"
      self.data['dot'] = File.open(dot_file).read
      self.data['title'] = data[name]
      self.data['text'] = Kramdown::Document.new(File.open(md_file).read).to_html
    end

    private

    # copied from Jekyll
    def sanitize_filename(name)
      name = name.gsub(/[^\w\s_-]+/, '')
      name = name.gsub(/(^|\b\s)\s+($|\s?\b)/, '\\1\\2')
      name = name.gsub(/\s+/, '_')
    end
  end

  class DataPagesGenerator < Generator
    safe true

    def generate(site)
      data = site.config['page_gen']
      puts "GEGEGE"
      if data
        data.each do |data_spec|
          # todo: check input data correctness
          
          template = data_spec['template'] || data_spec['data']
          name = data_spec['name']
          dir = data_spec['dir'] || data_spec['data']
          
          if site.layouts.key? template
            puts site.data['processes']
            records =  site.data['processes']
            records.each do |key,record|
                dot_file = '_data/' + data_spec['data'] + "/"+ key +".dot"
                svg_file = File.join('processes',key+'.svg')
                md_file = '_data/' + data_spec['data'] + "/"+ key +".md"
                IO.popen("dot -Tsvg -o #{svg_file}", 'r+') do |pipe|
                  pipe.puts(File.open(dot_file).read)
                  pipe.close_write
                end
              site.pages << DataPage.new(site, site.source, dir, record, key, template, dot_file, md_file)
              site.static_files << StaticFile.new(site, site.source, dir, key+'.svg')
            end
          else
            puts "error. could not find template #{template}" if not site.layouts.key? template
          end
        end
      end
    end
  end

  module DataPageLinkGenerator
    # use it like this: {{input | datapage_url: dir}}
    # output: dir / input .html
    def datapage_url(input, dir)
      dir + "/" + sanitize_filename(input) + ".html"
    end

    private

    # copied from Jekyll
    def sanitize_filename(name)
      name = name.gsub(/[^\w\s_-]+/, '')
      name = name.gsub(/(^|\b\s)\s+($|\s?\b)/, '\\1\\2')
      name = name.gsub(/\s+/, '_')
    end
  end

end

Liquid::Template.register_filter(Jekyll::DataPageLinkGenerator)

