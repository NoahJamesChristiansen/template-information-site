module Jekyll

  class SubjectGenerator < Generator

    safe true

    def generate(site)
	  topics = []
	  site.posts.docs.each do |post|
		ind_topics = post.topics.split(" ")
		
		ind_topics.each do |item|
			topics.push(item) unless topics.include?(item)
		end
	  end
	
      topics.each do |topic|
	    posts_topic = []
	    
		site.posts.docs.each do |post|
			if post.topics.include? topic
				posts_topic.push(post)
			end
		end
	  
        build_subpages(site, "topics", topic, posts_topic)
      end
    end

    def build_subpages(site, type, posts, post_topics)
      #posts[1] = posts[1].sort_by { |p| -p.date.to_f }
      atomize(site, type, posts, post_topics)
      paginate(site, type, posts, post_topics)
    end

    def atomize(site, type, posts, post_topics)
      path = "/topic/#{posts}"
      atom = AtomPageTopics.new(site, site.source, path, type, posts, post_topics)
      site.pages << atom
    end

    def paginate(site, type, posts, post_topics)
      pages = Jekyll::Paginate::Pager.calculate_pages(post_topics, site.config['paginate'].to_i)
      (1..pages).each do |num_page|
        pager = Jekyll::Paginate::Pager.new(site, num_page, post_topics, pages)
        path = "/topic/#{posts}"
        if num_page > 1
          path = path + "/page#{num_page}"
        end
        newpage = GroupSubPageTopics.new(site, site.source, path, type, posts)
        newpage.pager = pager
        site.pages << newpage

      end
    end
  end

  class GroupSubPageTopics < Page
    def initialize(site, base, dir, type, val)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), "topic.html")
      self.data["grouptype"] = type
      self.data[type] = val
    end
  end

  class AtomPageTopics < Page
    def initialize(site, base, dir, type, val, posts)
      @site = site
      @base = base
      @dir = dir
      @name = 'rss.xml'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), "topic.xml")
      self.data[type] = val
      self.data["grouptype"] = type
      self.data["posts"] = posts[0..9]
    end
  end
end
