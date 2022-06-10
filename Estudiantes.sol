pragma.solidity ^0.8.10; //Declaramos la version del compilador.

contract Estudiantes() //Creamos las variables que vamos a usar.
{
    private string _nombre;
    private string _apellido;
    private string _curso;
    private address _docente;
    private mapping(string => uint8) private _notas_materias;

constructor(string memory _name, string memory _apellido, string memory curso) {
        _name = name_;
        _apellido = apellido_;
        _curso = curso_;
        _docente = msg.sender;
    }

function apellido() public view returns (string memory) {
        return _apellido;
    }

function nombre_completo() public view returns (string memory) {
    return string.concat(_nombre, _apellido);
}

function curso() public view returns(string memory){
    return _curso;
}

function set_nota_materia(uint8 nota_, string memory materia_) public {
    require (msg.sender == _docente, "Solo el docente puede modificar las notas");
    _notas_materias[materia_] = nota_;
}

function nota_materia(string memory materia) public view returns(uint8){
    return _notas_materias[materia];
}

function aprobo(string memory materia) public view returns (bool){
    if(_notas_materias[materia] >= 60){
        return true;
    }
        false;
}


}
