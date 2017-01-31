Chat console application (Ruby edition)
================

This application communicate also with [elixir one](https://github.com/choosen/ConsoleSlackElixir), through RabbitMQ message broker

### :hash: App description
-------------
Simple console chat application.
Asking for name, joining to chat room, sending and receiving messages.

### :closed_lock_with_key: Technology stack
-------------

| Name |  Version |
| :--: | :---: |
| [Ruby](https://www.ruby-lang.org) | 2.3.3 |
| [RabbitMQ](https://www.rabbitmq.com/) | 3.6.6 |
| [Bundler](https://github.com/bundler/bundler) | 1.13.7 |

### :book: Setup
-------------
1. clone repository,
2. `cd path/to/repo`,
3. `bundle`,

### :book: Run
-------------
* `ruby chat.rb`
* on other terminal `ruby chat.rb` or run [elixir application](https://github.com/choosen/ConsoleSlackElixir)

### :information_source: Gems
-------------

* [bunny](https://github.com/ruby-amqp/bunny),
* [json](https://github.com/flori/json)

### :information_source: How to install RabbitMQ
-------------
* [Installation instructions](https://www.rabbitmq.com/download.html)
