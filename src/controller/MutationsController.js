const express = require('express');
var mutationService = require('../service/MutationsService.js');
const mutationsController = express();

mutationsController.set('port', process.env.PORT || 8181);
mutationsController.set('view engine','jade');

mutationsController.use(express.json());

mutationsController.post('/mutation', async function (request, response){
    response.send(mutationService.insertMutation(request.body));
});

mutationsController.put('/mutation', async function (request, response){
    response.send(await mutationService.updateMutation(request.body));
});

mutationsController.get('/mutation', async function (request, response){
    response.send(await mutationService.selectMutation());
});

mutationsController.post('/smutation', async function (request, response){
    response.send(await mutationService.getMutation(request.body));
});

mutationsController.post('/smutation', async function (request, response){
    response.send(await mutationService.searchMutation(request.body));
});

mutationsController.delete('/mutation', async function (request, response){
    response.send(await mutationService.deleteMutation(request.body));
});

mutationsController.get('/', function (request,response){
  mutationService.selectMutation().then(function(result){
  	console.log(result)
    response.render('index',
    {results:result});
  });
});

module.exports = mutationsController;
