const { Client } = require('pg')
const client = new Client({

        user: '',
        password: '',
        host: '',
        port: '',
        database: '',
          ssl: {
            rejectUnauthorized: true
          }
})

client.connect();

const MutationsService = {};

MutationsService.updateMutation = async (_data)=>{
  try{
    await client.query("UPDATE public.mutations SET DATE_MUTATION = ($2),VALEUR_FONCIERE = ($3), ADRESSE_COMPLETE = ($4), CODE_POSTAL = ($5), NOM_COMMUNE = ($6), CODE_COMMUNE = ($7), CODE_DEPARTEMENT = ($8) WHERE MUTATION = ($1)",
    [_data.mutation, _data.date_mutation, _data.valeur_fonciere, _data.adresse_complete, _data.code_postal, _data.nom_commune, _data.code_commune, _data.code_departement], function(err, result) {
      if (err) {
        return console.error('Error in query', err);
      }
      return extracData({'rows':result.rowCount});
    });
  }catch(error){
    throw Error("error");
  }
}

MutationsService.insertMutation = async (_data)=> {
  try{
    await client.query("INSERT INTO public.mutations (MUTATION, DATE_MUTATION, VALEUR_FONCIERE, ADRESSE_COMPLETE, CODE_POSTAL, NOM_COMMUNE, CODE_COMMUNE, CODE_DEPARTEMENT) VALUES (($1),($2),($3),($4),($5),($6),($7),($8))",
    [_data.mutation, _data.date_mutation, _data.valeur_fonciere, _data.adresse_complete, _data.code_postal, _data.nom_commune, _data.code_commune, _data.code_departement], function(err, result) {
      if (err) {
        return console.error('Error in query', err);
      }
      return extracData({'rows':result.rowCount});
    });
  }catch(error){
    throw Error("error");
  }
}

MutationsService.deleteMutation= async (_data)=> {
  try{
    await client.query("DELETE FROM public.mutations WHERE mutation = ($1)",
    [_data.mutation], function(err, result) {
      if (err) {
        return console.error('Error in query', err);
      }
      console.log(result)
      return extracData({'rows':result.rowCount});
    });
  }catch(error){
    throw Error("error");
  }
}

MutationsService.getMutation = async (_data)=>{
  try{
    let {rows} = await client.query("SELECT * FROM public.mutations WHERE mutation = ($1)", [_data.mutation]);
    console.log(rows)
    return extracData(rows);
  }catch(error){
    throw Error("error");
  }
}

MutationsService.searchMutation = async (_data)=>{
  try{
    console.log(_data.mutation);
    let {rows} = await client.query("SELECT * FROM public.mutations WHERE mutation LIKE '%' || $1 || '%'", [_data.mutation]);
    console.log(rows)
    return extracData(rows);
  }catch(error){
    throw Error("error");
  }
}

MutationsService.selectMutation = async (_data)=>{
  try{
    let {rows} = await client.query('SELECT * FROM public.mutations ORDER BY date_mutation DESC LIMIT 50');
    return extracData(rows);
  }catch(error){
    throw Error("error");
  }
}

function extracData(_data){
  return JSON.parse(JSON.stringify(_data));
}

module.exports = MutationsService;
 
