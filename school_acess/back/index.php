<?php
header("Content-Type: application/json; charset=UTF-8");
require_once "config.php";

$sql = "SELECT * FROM alunos";
$resultado = $conexao->query($sql);

$alunos = [];

if ($resultado) {
    while ($linha = $resultado->fetch_assoc()) {
        $alunos[] = $linha;
    }
}

echo json_encode($alunos, JSON_UNESCAPED_UNICODE);

$conexao->close();
?>