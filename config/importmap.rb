# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "crypto" # @2.1.0
pin "error-helper" # @0.1.0
pin "forever-agent" # @0.5.2
pin "fs" # @2.1.0
pin "http" # @2.1.0
pin "https" # @2.1.0
pin "json-stringify-safe" # @5.0.1
pin "mime" # @1.2.11
pin "net" # @2.1.0
pin "node-uuid" # @1.4.8
pin "path" # @2.1.0
pin "process" # @2.1.0
pin "qs" # @0.6.6
pin "querystring" # @2.1.0
pin "request" # @2.30.0
pin "stream" # @2.1.0
pin "tls" # @2.1.0
pin "url" # @2.1.0
pin "util" # @2.1.0
