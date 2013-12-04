Package.describe({
  summary: "Perfect widgets package yay"
});

Package.on_use(function (api,where) {
  api.add_files(['mscorlib.js'],'client');
  api.add_files(['PerfectWidgets.js'], 'client');
});
