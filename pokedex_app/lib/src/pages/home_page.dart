import 'package:flutter/material.dart';
import 'package:pokedex_app/src/models/pokemon_model.dart';
import 'package:pokedex_app/src/provider/pokemon_provides.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final pokemonProvider = new PokemonProvider();
  List<PokemonModel> pokemons = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getPokemon().then((resp) => {
      setState((){
        isLoading = false;
      })
    });
  }

  Future<bool> getPokemon() async{
    setState(() {
      isLoading = true;
    });
    pokemons = await pokemonProvider.getPokemon();
    return false;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),

              Text('Pokemon', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),

              ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, i){
                  return _PokemonCard(pokemons[i]);
                },
                itemCount: pokemons.length,
              ),
          ],
        ),
      ),
    ),
   );
  }
}

class _PokemonCard extends StatelessWidget {

  final PokemonModel pokemon;

  _PokemonCard(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Card(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            Image.network(pokemon.img),
            SizedBox(height: 20),
            Text(pokemon.name)
          ],
        ),
      ),
    );
  }
}