USE UbiDify;
GO

-- Insertar 17 conductores adicionales
DECLARE @i INT = 1;
WHILE @i <= 17
BEGIN
    INSERT INTO Conductores (Nombre, Licencia, Telefono, Activo)
    VALUES (CONCAT('Conductor ', @i), CONCAT('LIC', RIGHT('000' + CAST(@i AS NVARCHAR(3)), 3)), CONCAT('555-0', RIGHT('100' + CAST(@i AS NVARCHAR(3)), 3)), 1);
    SET @i = @i + 1;
END
GO

-- Insertar 97 usuarios adicionales
DECLARE @j INT = 1;
WHILE @j <= 97
BEGIN
    INSERT INTO Usuarios (Nombre, Email, Telefono, Fecha_Registro)
    VALUES (CONCAT('Usuario ', @j), CONCAT('usuario', @j, '@example.com'), CONCAT('555-1', RIGHT('100' + CAST(@j AS NVARCHAR(3)), 3)), DATEADD(DAY, @j, '2021-01-01'));
    SET @j = @j + 1;
END
GO

-- Insertar 17 vehículos adicionales
DECLARE @k INT = 1;
WHILE @k <= 17
BEGIN
    INSERT INTO Vehiculos (ID_Conductor, Marca, Modelo, Placa)
    VALUES (@k, CONCAT('Marca ', @k), CONCAT('Modelo ', @k), CONCAT('PLC', RIGHT('000' + CAST(@k AS NVARCHAR(3)), 3)));
    SET @k = @k + 1;
END
GO

-- Insertar 497 viajes adicionales
DECLARE @l INT = 1;
DECLARE @veh INT, @usr INT, @inicio DATETIME, @fin DATETIME;
WHILE @l <= 497
BEGIN
    SET @veh = 1 + (@l % 17); -- Asegura que el ID_Vehiculo esté dentro de los límites
    SET @usr = 1 + (@l % 97); -- Asegura que el ID_Usuario esté dentro de los límites
    SET @inicio = DATEADD(MINUTE, 15 * @l, '2022-01-01T08:00:00');
    SET @fin = DATEADD(MINUTE, 15 * @l + 30, '2022-01-01T08:00:00');

    INSERT INTO Viajes (ID_Usuario, ID_Vehiculo, Fecha_Hora_Inicio, Fecha_Hora_Fin, Costo)
    VALUES (@usr, @veh, @inicio, @fin, CAST(RAND() * 100 + 50 AS DECIMAL(10, 2))); -- Costo aleatorio entre 50 y 150
    SET @l = @l + 1;
END
GO


