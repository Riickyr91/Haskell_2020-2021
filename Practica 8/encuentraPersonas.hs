type Entrada = (Persona, Edad, Telefono)
type Persona = String
type Edad = Int
type Telefono = String

type Listin = [Entrada]

encontrar::Listin -> Persona -> [Telefono]
encontrar lista persona = [telef| (per, edad, telef) <- lista, persona == per]