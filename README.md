Custom Error Message
====================

This plugin gives you the option to not have your custom validation error message 
prefixed with the attribute name.

Rails 3 and Ruby 1.9
--------------------

Custom Error Message is Rails 3 and Ruby 1.9 compatible

Usage
-----

Sometimes generated error messages don't make sense.

    validates_inclusion_of :domain, :in => {'.com', 'cn'}
    
input is not included in the list,

should be 

inputs is not included in the list, you should choose from [.com, .cn]


CREDITS
-------

This plugin was originally written by Junwen Yang(x1022069@gmail.com)
