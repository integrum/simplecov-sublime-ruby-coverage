SimpleCov Sublime Ruby Coverage Formatter gem
=============================================

Is a formatter for the ruby 1.9+ coverage gem: [SimpleCov](http://github.com/colszowka/simplecov) to work with the [Ruby Coverage Formatter](http://github.com/integrum/SublimeRubyCoverage) plugin for Sublime 2

Install
=======

    $ [sudo] gem install simplecov-sublime-ruby-coverage

Usage
=====

    require 'simplecov-sublime-ruby-coverage'
    SimpleCov.formatter = SimpleCov::Formatter::SublimeRubyCoverageFormatter

TODO
====

The actual version generates many simple text files, one for every source file.

Credits
=======

**Authors** Drew LeSueur, Jade Meskill and Roy van de Water: http://integrumtech.com  
**Copyright** Copyright (c) 2012 Integrum Technologies, LLC  
**License** Released under the MIT license.  
**Originally Forked From** http://github.com/fguillen/simplecov-csv  

