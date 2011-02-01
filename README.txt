= AdMob Ruby on Rails integration code

* http://www.admob.com

== DESCRIPTION:

Enables easy integration of AdMob services (ads and/or analytics) into a RoR mobile site.

== SYNOPSIS:

=== Setting up

* Get a publisher_id and/or analytics_id from http://www.admob.com and/or http://analytics.admob.com
* Add <tt>require "admob"</tt> to app/controllers/application.rb, or to any specific controller as needed.
* Provide some or all default settings in your environment.rb . e.g. :
    require 'admob'
    AdMob::config do |c|
      c.publisher_id = 'YOUR_PUBLISHER_ID'
      c.analytics_id = 'YOUR_ANALYTICS_ID'
      c.timeout = 1
      c.encoding = 'UTF-8'
      c.raise_exceptions = false
      c.cookie_domain = 'example.com' # you can override this setting in AdMob::set_cookie()
      c.cookie_path = '/' # you can override this setting in AdMob::set_cookie()
    end
* In a view, where you want an ad, place an ad request.
* Note: You must provide your publisher_id and/or analytics_id in the default setting, or when you make the ad request (see below).

=== Using Cookies

* AdMob now uses cookies to enhance ad targeting and analytics data.
* The easiest way to enable AdMob cookies on your website is to add the following code snippet to your ActionController::Base class (usually in app/controllers/application.rb)
* This will cause AdMob::set_cookie() to be executed on every request (the function will return immediately if a cookie does not need to be set)

    require 'admob'
    class ApplicationController < ActionController::Base
    
      ## begin AdMob cookie snippet ##
      before_filter :admob_set_cookie
      
      def admob_set_cookie
        AdMob::set_cookie(request, cookies)
      end
      ## end AdMob cookie snippet ##
      
    end
  
=== Configuring Cookies (IMPORTANT if your site uses multiple subdomains)

* By default, the domain of the cookie is for the host that set it. This means that cookies set from a.example.com are not visible from b.example.com
* To allow AdMob cookies to be visible everywhere on your site, you need to set a default cookie domain in environment.rb
* The default cookie domain should be the root domain of your mobile site (e.g. "example.com", "example.co.uk") 

    require 'admob'
    AdMob::config do |c|
      c.cookie_domain = 'example.com' # if your main domain is www.example.com
      c.cookie_domain = 'example.co.uk' # if your main domain is www.example.co.uk
    end

=== Sample requests

==== If you've configured a default publisher and/or analytics id

 <%= AdMob::request(request, session.session_id) %>

==== If you didn't configure a default publisher_id or want to override the configured default publisher_id

 <%= AdMob::request(request, session.session_id, :publisher_id => "YOUR_PUBLISHER_ID") %>

==== Request a test ad (happens by default when in test or development mode)

 <%= AdMob::request(request, session.session_id, :test => true) %>

==== Request an ad, providing demographic info and keywords

 <%= AdMob::request(request, session.session_id, :publisher_id => "YOUR_PUBLISHER_ID", :dob => "19800229", :gender => "male", :postal_code => "90210", :keywords => 'ruby gem admob') %>

==== Make an analytics request only

 <%= AdMob::request(request, session.session_id, :ad_request => false) %>

See the documentation for #AdMob::request for a list of all params that can be set for a request.

== REQUIREMENTS:

* An AdMob publisher_id and/or analytics_id (get them at http://www.admob.com and http://analytics.admob.com)

== INSTALL:

<tt>sudo gem install admob</tt>

== HELP:

Additional information can be found at http://developer.admob.com

== LICENSE:

(The BSD License)

Copyright (c) 2008, AdMob, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
