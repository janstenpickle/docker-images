file { "/ghost/config.js":
  content => template("config.js.erb"),
}
