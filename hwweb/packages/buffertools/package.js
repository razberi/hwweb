Package.describe({
  summary: "Added buffer tools to packages yay"
});

Npm.depends({
  "buffertools": "1.1.1"
});

Package.on_use(function (api) {
  api.add_files("buffertools.js", ["server"]);
});
