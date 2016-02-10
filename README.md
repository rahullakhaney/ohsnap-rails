# Ohsnap

[![Gem Version](https://badge.fury.io/rb/ohsnap-rails.svg)](https://badge.fury.io/rb/ohsnap-rails)

A ruby gem for ohsnap.js [library by justin domingue](https://github.com/justindomingue)

A simple notification jQuery/Zepto library designed to be used in mobile apps

![Ohsnap Alerts in action](/ohsnap.png)
[Live Demo](http://justindomingue.github.io/ohSnap/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ohsnap-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ohsnap-rails

## Usage

To your ```application.js``` file, add:
```Javascript
//= require ohsnap
```

In your application helper app/helpers/application_helper.rb add:

```Ruby
module ApplicationHelper
    ALERT_TYPES = [:blue, :green, :orange, :red] unless const_defined?(:ALERT_TYPES)
    def snap_flash(options = {})
        flash_messages = []
        flash.each do |type, message|
          next if message.blank?

          type = type.to_sym
          type = :blue if type == :info
          type = :green if type == :notice
          type = :orange  if type == :alert
          type = :red  if type == :error

          next unless ALERT_TYPES.include?(type)
          Array(message).each do |msg|
            flash_messages << "ohSnap('#{msg}', {color: '#{type.to_s}', duration: '7000'});" if msg
          end
        end
        javascript_tag flash_messages.join("\n").html_safe
    end
end
```

In your application.html file here app/views/layout/application.html.erb add:

```HTML
<div id="ohsnap"></div>
<%= snap_flash %>
```

Credits to [Dmytro Koval](https://github.com/dawidof) for making pointing out a typo and for the application_helper.


Ohsnap created div with classes .alert .alert-color .So you would need to have:

```CSS
/* ALERTS */
/* inspired by Twitter Bootstrap */

.alert {
  padding: 15px;
  margin-bottom: 20px;
  border: 1px solid #eed3d7;
  border-radius: 4px;
  position: absolute;
  bottom: 0px;
  right: 21px;
  /* Each alert has its own width */
  float: right;
  clear: right;
}

.alert-red {
  color: white;
  background-color: #DA4453;
}
.alert-green {
  color: white;
  background-color: #37BC9B;
}
.alert-blue {
  color: white;
  background-color: #4A89DC;
}
.alert-yellow {
  color: white;
  background-color: #F6BB42;
}
.alert-orange {
  color:white;
  background-color: #E9573F;
}
```

in your css file.

## Customizations

[Visit the offical ohsnap repo for customizations and a more detailed usage guide](https://github.com/justindomingue/ohSnap)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rahullakhaney/ohsnap-rails

Follow me on [Twitter](https://www.twitter.com/istereotype) for more updates on the #20in20.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

