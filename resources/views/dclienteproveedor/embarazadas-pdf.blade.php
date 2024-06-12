<!DOCTYPE html>
<html>
<head>
    <title>Embarazadas</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Lista de Embarazadas</h1>
    <table>
        <thead>
            <tr>
                <th>Denominacion</th>
                <th>Carnet de Identidad</th>
                <th>Fecha de Creado</th>
            </tr>
        </thead>
        <tbody>
            @foreach($dclienteproveedors as $dclienteproveedor)
                <tr>
                    <td>{{ $dclienteproveedor->denominacion }}</td>
                    <td>{{ $dclienteproveedor->carnetidentidad }}</td>
                    <td>{{ $dclienteproveedor->created_at }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
