---
layout: null
---

(function() {
	
  function displaySearchResults(results, store, page_start, searchTerm) {
    var results_per_page = 2;
    var start_results = (page_start - 1) * results_per_page;
    var end_results = (page_start) * results_per_page;
    var max_results = Math.min(end_results, results.length);
  
    var searchResults = document.getElementById('search-results');

    if (results.length) { // Are there any results?
      var appendString = '';

           // for (var i = 0; i < results.length; i++) {  // Iterate over the results
           for (var i = start_results; i < results.length && i < end_results; i++) 
            {  // Iterate over the results
            var item = store[results[i].ref];
            
           if(item.title.length > 0)
           
           {
            appendString += '<a href="' + item.url + '"><h4 style="font-size:20pt;">' + item.title + '</h4></a>';
            appendString += '<p style="font-size: 16px;">' + item.summary + '</p>';
		    appendString += '<p style="font-size: 10pt; margin-top: -10px; padding-bottom: 25px; margin-bottom: 25px; border-bottom: 1px solid #777;">Type: ' + item.type + '</p>';
          }
          
      }
      
      appendString += '<p style="font-size: 12px;">' + 'Results ' + (start_results+1) + ' to ' + max_results + ' out of ' + results.length + ' result(s).'+ '</p>';
      
      // Following does next/previous
      appendString += '<p style="font-size: 16px;">';
      
      if(start_results > 0){
        appendString += '<a href="/search.html?query=' + searchTerm + '&page=' + (page_start - 1) + '">Previous</a>';
      }
      
      if(max_results < results.length)
      {
        if(start_results > 0){
            appendString += " | ";
        }
        
        appendString += '<a href="/search.html?query=' + searchTerm + '&page=' + (page_start + 1) + '">Next</a>';
      }
      
      appendString += '</p>';

      searchResults.innerHTML = appendString;
    } else {
      // this is a hack for the inability to submit different language strings here
      searchResults.innerHTML = '<span style="color: red"><i class="fa fa-times" aria-hidden="true"></i><i class="fa fa-times" aria-hidden="true"></i><i class="fa fa-times" aria-hidden="true"></i><i class="fa fa-times" aria-hidden="true"></i><i class="fa fa-times" aria-hidden="true"></i></span><p><br/>{{site.uistring.no_search_results_found}}</p>';
    }
  }

  function getQueryVariable(variable, vars) {
    for (var i = 0; i < vars.length; i++) {
      var pair = vars[i].split('=');

      if (pair[0] === variable) {
        return decodeURIComponent(pair[1].replace(/\+/g, '%20'));
      }
    }
  }

    var query_value = window.location.search.substring(1);
    var vars_value = query_value.split('&');

  var searchTerm = getQueryVariable('query', vars_value);
  var page_start = Number(getQueryVariable('page', vars_value));
  
  if(isNaN(page_start))
  {
    page_start = 1;
  }

  if (searchTerm) {
    document.getElementById('search-box').setAttribute("value", searchTerm);

    // Initalize lunr with the fields it will be searching on. I've given title
    // a boost of 10 to indicate matches on this field are more important.
    var idx = lunr(function () {
      this.field('id');
      this.field('title', { boost: 10 });
      this.field('tags');
      this.field('content');
    });

    for (var key in window.store) { // Add the data to lunr
      idx.add({
        'id': key,
        'title': window.store[key].title,
        'tags': window.store[key].tags,
        'content': window.store[key].content
      });

      var results = idx.search(searchTerm); // Get lunr to perform a search
    }
    displaySearchResults(results, window.store, page_start, searchTerm); // We'll write this in the next section
  }
}

)();
