-- FontAwesome shortcode implementation
return {
  ["fa"] = function(args, kwargs)
    local icon = pandoc.utils.stringify(args[1])
    return pandoc.RawInline('html', '<i class="fa fa-' .. icon .. '"></i>')
  end,
  
  ["fa-solid"] = function(args, kwargs)
    local icon = pandoc.utils.stringify(args[1])
    return pandoc.RawInline('html', '<i class="fa-solid fa-' .. icon .. '"></i>')
  end,
  
  ["fa-regular"] = function(args, kwargs)
    local icon = pandoc.utils.stringify(args[1])
    return pandoc.RawInline('html', '<i class="fa-regular fa-' .. icon .. '"></i>')
  end,
  
  ["fa-brands"] = function(args, kwargs)
    local icon = pandoc.utils.stringify(args[1])
    return pandoc.RawInline('html', '<i class="fa-brands fa-' .. icon .. '"></i>')
  end,
  
  ["fa-square-rss"] = function(args, kwargs)
    return pandoc.RawInline('html', '<i class="fa-solid fa-square-rss"></i>')
  end,
  
  ["fa-file-pdf"] = function(args, kwargs)
    return pandoc.RawInline('html', '<i class="fa-regular fa-file-pdf"></i>')
  end
}
