module Jekyll

  class AuthorGenerator < Generator

    safe true

    def generate(site)
	  authors = []
	  site.posts.docs.each do |post|
	    if defined?(post.about_authors) && post.about_authors.size > 0
		    ind_authors = post.about_authors.split(" ")
		    
		    ind_authors.each do |item|
		    	authors.push(item) unless authors.include?(item)
		    end
		end
	  end
	
      authors.each do |author|
	    posts_author = []
	    
		site.posts.docs.each do |post|
		    if defined?(post.about_authors) && post.about_authors.size > 0
			    if post.about_authors.include? author
				    posts_author.push(post)
			    end
			end
		end
	  
        build_subpages(site, "about_authors", author, posts_author)
      end
    end

    def build_subpages(site, type, posts, post_authors)
      #posts[1] = posts[1].sort_by { |p| -p.date.to_f }
      atomize(site, type, posts, post_authors)
      paginate(site, type, posts, post_authors)
    end

    def atomize(site, type, posts, post_authors)
      path = "/author/#{posts}"
      atom = AtomPageAuthors.new(site, site.source, path, type, posts, post_authors)
      site.pages << atom
    end

    def paginate(site, type, posts, post_authors)
      pages = Jekyll::Paginate::Pager.calculate_pages(post_authors, site.config['paginate'].to_i)
      (1..pages).each do |num_page|
        pager = Jekyll::Paginate::Pager.new(site, num_page, post_authors, pages)
        path = "/author/#{posts}"
        if num_page > 1
          path = path + "/page#{num_page}"
        end
        newpage = GroupSubPageAuthors.new(site, site.source, path, type, posts)
        newpage.pager = pager
        site.pages << newpage

      end
    end
  end

  class GroupSubPageAuthors < Page
    def initialize(site, base, dir, type, val)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), "author.html")
      self.data["grouptype"] = type
      self.data[type] = val
    end
  end

  class AtomPageAuthors < Page
    def initialize(site, base, dir, type, val, posts)
      @site = site
      @base = base
      @dir = dir
      @name = 'rss.xml'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), "author.xml")
      self.data[type] = val
      self.data["grouptype"] = type
      self.data["posts"] = posts[0..9]
    end
  end
end
