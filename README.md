# Utopian API Ruby client

Please follow me at: https://steemit.com/@yuxi

## What is the project about?

This project is a wrapper of Utopian APIs. It provides an easy way to use Utopian APIs for Ruby developers. 

## Technology Stack

Ruby V2.4
Gem V2.6.11

## Test

A set of rspec test has been written here: https://github.com/yuxir/utopian-ruby/blob/master/spec/utopian_ruby_spec.rb

  
## Installation

Assuming you already have Ruby development configured, then run:

```bash
gem install utopian_ruby_api
```

## How to use it?

### Get moderator information

#### Get all moderators JSON:

```bash
require 'utopian_ruby_api'
UtopianRuby::UtopianRubyAPI.get_moderators()["results"]
```

#### Get a particular moderator’s metadata

```bash
UtopianRuby::UtopianRubyAPI.get_moderator('elear')
```

#### Get all moderators objects:

```bash
require 'utopian_ruby_api'

UtopianRuby::UtopianRubyAPI.get_moderators_obj().each do |m|
      puts m.account
end
```

#### Get a particular moderator’s object

```bash
UtopianRuby::UtopianRubyAPI.get_moderator_obj('elear')
```

#### Check if a user is a moderator

```bash
UtopianRuby::UtopianRubyAPI.is_moderator('elear')
```

#### Check if a user is a supervisor

```bash
UtopianRuby::UtopianRubyAPI.is_supervisor('espoem')
```

### Get sponsor information
#### Get all sponsors  in JSON

```bash
UtopianRuby::UtopianRubyAPI.get_sponsors()["results"]
```

#### Check if a user is a sponsor

```bash
UtopianRuby::UtopianRubyAPI.is_sponsor('ned')
```

### Get post information

Get a post information in JSON

```bash
UtopianRuby::UtopianRubyAPI.get_post('espoem','old-moderated-posts-are-received-and-shown-instead-of-the-recent-one')
```

Get post objects

```bash
UtopianRuby::UtopianRubyAPI.get_posts_obj({"limit":2}).each do |p|
      puts p.author
      puts p.moderator
end
```

Get a particular post object:

```bash
UtopianRuby::UtopianRubyAPI.get_post_obj('espoem','old-moderated-posts-are-received-and-shown-instead-of-the-recent-one')
```

Get posts by category

```bash
UtopianRuby::UtopianRubyHelper.get_posts_by_type("development",{"limit":5})
```

Get post objects by category

```bash
UtopianRuby::UtopianRubyHelper.get_posts_obj_by_type("development",{"limit":5})
```

Get post objects by moderator
```bash
UtopianRuby::UtopianRubyHelper.get_posts_obj_by_moderator("helo",{"limit":10,"type":"development"})
```

Get post repository
```bash
UtopianRuby::UtopianRubyHelper.get_post_repository('yuxi','utopian-api-ruby-client')
```


### Get Utopian status

Get Utopian current status

```bash
UtopianRuby::UtopianRubyAPI.stats()
```

Check if Utopian bot is voting

```bash
UtopianRuby::UtopianRubyAPI.is_voting()
```

### Get categories

```bash
require 'utopian_ruby_api'

UtopianRuby::UtopianRubyAPI.get_categories()
```


