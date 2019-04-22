module ActiveRecord
  class Error

protected

    def generate_full_message(options = {})
      keys = [
        :"full_messages.#{@message}",
        :'full_messages.format'
      ]
      

      keys.push('%{attribute} %{message}')

      options.merge!(:default => keys, :message => self.message)        

      I18n.translate(keys.shift, options)
    end
  end
  
end