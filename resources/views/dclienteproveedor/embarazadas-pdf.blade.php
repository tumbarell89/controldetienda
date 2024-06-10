
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Embarazadas</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h1>Lista de Embarazadas</h1>
    <table>
        <thead>
            <tr>
                <th>Denominación</th>
                <th>Carnet de Identidad</th>
                <th>Fecha de Creado</th>
            </tr>
        </thead>
        <tbody>
            @foreach($embarazadas as $embarazada)
            <tr>
                <td>{{ $embarazada->denominacion }}</td>
                <td>{{ $embarazada->carnetidentidad }}</td>
                <td>{{ $embarazada->created_at }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
