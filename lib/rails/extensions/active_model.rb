module ActiveModel
  class Errors
    def full_messages
      full_messages = []
      i = 0
      details = @details.map{|k,v| v}.flatten
      each do |attribute, messages|
        detail = details[i]
        i += 1
        messages = Array.wrap(messages)
        next if messages.empty?
            
        if attribute == :base
          messages.each {|m| full_messages << m }
        else          
          attr_name = attribute.to_s.gsub('.', '_').humanize
          attr_name = @base.class.human_attribute_name(attribute, :default => attr_name)
          options = { :default => "%{attribute} %{message}", :attribute => attr_name }
          
          messages.each do |m|
            if  detail[:error] == :inclusion
                in_list = detail[:in] ||  detail[:within]
                m += " you should choose from [#{in_list.join(',')}]" 
                full_messages << I18n.t(:"errors.format", options.merge(:message => m))
            else        
                full_messages << I18n.t(:"errors.format", options.merge(:message => m))
            end

          end
        end
      end
      full_messages
    end
  end
    
  module Validations
    class InclusionValidator < EachValidator 
      def validate_each(record, attribute, value)
        unless include?(record, value)
          record.errors.add(attribute, :inclusion, options.merge(value: value))
        end
      end
    end
  end
end