Knife Spec
==========
[![Gem Version](https://badge.fury.io/rb/knife-spec.png)](http://badge.fury.io/rb/knife-spec)
[![Build Status](https://travis-ci.org/sethvargo/knife-spec.png?branch=master)](https://travis-ci.org/sethvargo/knife-spec)

knife-spec is a knife plugin that automatically generates Chef cookbook specs (tests) stubs when you create a new cookbook with knife.


Installation
------------
Add this line to your cookbook's `Gemfile`:

```ruby
gem 'knife-spec'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install knife-spec


Usage
-----
There are no usage instructions! Simply having knife-spec installed will automatically hook into Chef's default `cookbook_create` process to generate ChefSpec tests.

    $ knife cookbook create COOKBOOK


Contributing
------------
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


License & Authors
-----------------
- Author: Seth Vargo (sethvargo@gmail.com)

```text
Copyright: 2013, Seth Vargo (<sethvargo@gmail.com>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
