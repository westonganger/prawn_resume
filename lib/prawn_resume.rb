require "prawn"

require "prawn_resume/version"
require "prawn_resume/errors"
require "prawn_resume/mime"
require "prawn_resume/action_controller_renderer"

require "prawn_resume/templates"

module PrawnResume

  def self.to_pdf(template: PrawnResume::Templates::Default, data: )
    if template.is_a?(PrawnResume::Templates::BaseTemplate)
      @template = template
    else
      @template = PrawnResume::Templates.from_name(template.to_s).new
    end

    validate_schema(template: template, data: data)

    template.render_pdf
  end

  def self.to_pdf_file(filename: , **args)
    File.write(filename, "wb") do |f|
      f.write self.to_pdf(*args)
    end
  end

  private

  def self.validate_schema(template:, data:)
    template.schema.each_with_index do |schema_entry, i|
      if !validate_entry(schema_entry, data[i])
        raise PrawnResume::Error
      end
    end

    return true
  end

  def self.validate_entry(schema_entry, data_entry)
    [Hash, Array].each do |type|
      if schema_entry.is_a?(type) != data_entry.is_a?(type)
        return false
      end
    end

    if schema_entry.is_a?(Hash)
      if !validate_hash(schema_entry, data_entry)
        return false
      end
    elsif schema_entry.is_a?(Array) && data_entry[0]
      if schema_entry[0].is_a?(Hash) && !validate_hash(schema[0], data_entry[0])
        return false
      end
    end

    return true
  end

  def self.validate_hash(schema_hash, data_entry)
    if !(schema_hash.keys - data_entry.keys).empty?
      return false
    else
      schema_entry.each_with_index do |schema_item, i|
        unless validate_entry.call(schema_item, data_entry[i])
          return false
        end
      end
    end

    return true
  end

end
