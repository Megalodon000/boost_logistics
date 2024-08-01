# Pin npm packages by running ./bin/importmap

# Pin the application entry point
pin "application", preload: true

# Pin Turbo for handling the dynamic loading and navigation
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true

# Pin Stimulus for handling JavaScript controllers
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true

# Pin Stimulus Loading for managing the loading state
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true

# Pin all controllers in the specified directory
pin_all_from "app/javascript/controllers", under: "controllers"
