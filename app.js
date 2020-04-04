var app = require('./src/controller/MutationsController');

var port = app.get('port');

app.listen(port, function () {
  console.log('Mutations listening on port: '+ port +'!');
});
