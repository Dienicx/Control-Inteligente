clc;
clear;
% Coordenadas de las 10 ciudades
coordenadas = [
    0.1 0.1;
    0.9 0.5;
    0.9 0.1;
    0.45 0.9;
    0.9 0.8;
    0.7 0.9;
    0.1 0.45;
    0.45 0.1;
    0.5 0.5;
    0.37 0.37
];

% Número de ciudades en dependencia de las coordenadas provistas
numCiudades = size(coordenadas, 1);

% Generar todas las permutaciones de las ciudades
permutaciones = perms(1:numCiudades);

% Calcular la distancia para cada permutación y encontrar la ruta óptima
distanciaMinima = Inf;
rutaOptima = [];
for i = 1:size(permutaciones, 1)
    rutaActual = permutaciones(i, :);
    distanciaActual = 0;
    
    % Calcular la distancia total de la ruta actual
    for j = 1:numCiudades - 1
        distanciaActual = distanciaActual + norm(coordenadas(rutaActual(j), :) - coordenadas(rutaActual(j + 1), :));
    end
    distanciaActual = distanciaActual + norm(coordenadas(rutaActual(end), :) - coordenadas(rutaActual(1), :)); % Volver al inicio
    
    % Actualizar la distancia mínima y la ruta óptima si es necesario
    if distanciaActual < distanciaMinima
        distanciaMinima = distanciaActual;
        rutaOptima = rutaActual;
    end
end

% Mostrar la ruta óptima y la distancia mínima
disp('Ruta óptima:');
disp(rutaOptima);
disp(['Distancia mínima: ', num2str(distanciaMinima)]);

% Graficar la ruta óptima
figure;
plot(coordenadas(:, 1), coordenadas(:, 2), 'x'); % Dibujar Ciudades
hold on;
for i = 1:numCiudades - 1
    ciudad1 = coordenadas(rutaOptima(i), :);
    ciudad2 = coordenadas(rutaOptima(i + 1), :);
    plot([ciudad1(1), ciudad2(1)], [ciudad1(2), ciudad2(2)], '-o'); % Dibujar Rutas
end
% Volver a la primera ciudad
plot([coordenadas(rutaOptima(end), 1), coordenadas(rutaOptima(1), 1)], ...
     [coordenadas(rutaOptima(end), 2), coordenadas(rutaOptima(1), 2)], '-o');

title('Ruta óptima');
xlabel('Coordenada X');
ylabel('Coordenada Y');
grid on;
hold off;
