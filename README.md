# Keep

It makes keeping config information pretty easy.

## Install

    gem install keep

## Usage

    require 'keep'
    keep = Keep.new('config/settings.yml')
    keep.set(:password,'Ellen Page')
    keep.get(:password)

Just tell Keep where to keep things, then tell it a key and what the value is.

Keep currently serializes to YAML (although different backends are likely to
come next- pull requests welcome).

## More

    keep = Keep.new('config/settings.yml')
    keep.present?(:password) # => 'Ellen Page'

    keep.keys # => ['Ellen Page']

## Other important information

Nothing else is important.
