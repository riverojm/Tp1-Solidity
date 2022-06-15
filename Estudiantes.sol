pragma solidity ^0.8.10; //Declaramos la version del compilador.

contract Estudiantes //Creamos las variables que vamos a usar.
{
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping(string => uint8) private _notas_materias;
    string[] private SubjectNames;

constructor(string memory _name, string memory apellido_, string memory curso)
    {
        _nombre = _name;
        _apellido = apellido_;
        _curso = curso;
        _docente = msg.sender;
    }

function apellido() public view returns (string memory) {
        return _apellido;
    }

function nombre_completo() public view returns (string memory) {
    return string(bytes.concat(bytes(_nombre), " ", bytes(_apellido)));
}

function curso() public view returns(string memory){
    return _curso;
}

function set_nota_materia(uint8 nota_, string memory materia_) public {
    require (msg.sender == _docente, "Solo el docente puede modificar las notas");
    SubjectNames.push(materia_);
    _notas_materias[materia_] = nota_;
}

function nota_materia(string memory materia) public view returns(uint8){
    return _notas_materias[materia];
}

function aprobo(string memory materia) public view returns (bool){
    if(_notas_materias[materia] >= 60){
        return true;
    }
    return  false;
}

    function promedio() public view returns(uint)
    {
        uint Sum;

        for(uint i= 0; i <= SubjectNames.length; i++)
        {
            Sum += _notas_materias[SubjectNames[i]];
        }

        return Sum / SubjectNames.length;
    }
}
