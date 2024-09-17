module Jekyll

  class DatesGenerator < Generator

    safe true

    def generate(site)
	
	  # To do: Topics should be an array of years
	  # each array item is an array of dates that years
	  
	  # first get all years in pages
	  years = []
	  site.posts.docs.each do |post|
		d = Date.parse(post.date.to_s).year
		if !years.include? d
			years.push(Date.parse(post.date.to_s).year)
		end
	  end
		
      years.each do |yr|
	  
		  posts = []
		  site.posts.docs.each do |post|
			d = Date.parse(post.date.to_s).year
			if d == yr
				posts.push(post)
			end
		  end
	  
        build_months(site, yr, posts)
      end
    end
	
	def build_months(site, yr, posts)
	  months = []
	  month_posts = []
	  posts.each do |post|
		d = Date.parse(post.date.to_s).year
		if !months.include? d
			months.push(Date.parse(post.date.to_s).month)
			month_posts.push(post)
		end
	  end
		
      months.each do |month|
        build_subpages(site, "datetime", month, yr, posts)
      end
	end

    def build_subpages(site, type, month, yr, posts)
      #posts[1] = posts[1].sort_by { |p| -p.date.to_f }
      atomize(site, type, posts, yr, month)
      paginate(site, type, posts, yr, month)
    end

    def atomize(site, type, posts, yr, month)
      path = "/date/#{yr}/#{month}"
      atom = AtomPageDates.new(site, site.source, path, type, posts[0], posts[1])
      site.pages << atom
    end

    def paginate(site, type, posts, yr, month)
      pages = Jekyll::Paginate::Pager.calculate_pages(posts, site.config['paginate'].to_i)

      (1..pages).each do |num_page|
        pager = Jekyll::Paginate::Pager.new(site, num_page, posts, pages)
        path = "/date/#{yr}/#{month}"
        if num_page > 1
          path = path + "/page#{num_page}"
        end
        newpage = GroupSubPageDates.new(site, site.source, path, type, yr, month)
        newpage.pager = pager
        site.pages << newpage

      end
    end
  end

  class GroupSubPageDates < Page
    def initialize(site, base, dir, type, yr, month)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), "date.html")
      self.data["grouptype"] = type
	  self.data["year"] = yr
	  self.data["month"] = month
    end
  end

  class AtomPageDates < Page
    def initialize(site, base, dir, type, val, posts)
      @site = site
      @base = base
      @dir = dir
      @name = 'rss.xml'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), "date.xml")
      self.data[type] = val
      self.data["grouptype"] = type
      #self.data["posts"] = posts[0..9]
    end
  end
end
