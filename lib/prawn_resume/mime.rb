if defined?(Mime)
  unless Mime::Type.lookup_by_extension(:pdf)
    Mime::Type.register_alias("application/pdf", :pdf)
  end
end
